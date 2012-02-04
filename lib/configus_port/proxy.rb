module ConfigusPort
  class Proxy
    def initialize(config, &block)
      @config = config || {}
      instance_eval(&block)
    end

    def result
      @config
    end

    def method_missing(m, *args, &block)
      if block_given?
        proxy = self.class.new(@config[m], &block)
        @config[m] = proxy.result
      else
        @config[m] = args.first
      end
    end
  end
end
