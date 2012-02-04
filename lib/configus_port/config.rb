module ConfigusPort
  class Config

    def [](v)
      send v
    end

    def each_pair(&block)
      @config.each_pair do |key, value|
        if value.is_a? Hash
          value.each_pair &block
        else
          block.call key, value
        end
      end
    end

    def initialize(result)
      @config = result
      (class << self; self; end).class_eval do
        result.each_pair do |key, value|
           if value.kind_of? ::Hash
             value = ::ConfigusPort::Config.new(value)
           end
           define_method key do
             value
           end
        end
      end
    end
  end
end
