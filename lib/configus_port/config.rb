module ConfigusPort
  module Config
    def self.build(env, &block)
      builder = ConfigusPort::Builder.new
      @config = builder.build(env, &block)
    end
  end
end
