module ConfigusPort
  class Config
    def initialize(result)
      raise result.inspect
      (class << self; self; end).class_eval do
        result.each_pair do |key, value|
           if value.kind_of? Hash
             value = ConfigusPort::Config.new(value)
           end
           define_method key do
             value
           end
        end
      end
    end
  end
end
