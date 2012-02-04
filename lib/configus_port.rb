require "configus_port/version"

module ConfigusPort
  autoload "Config", "configus_port/config"
  autoload "Builder", "configus_port/builder"

  def self.build(*args, &block)
    result = ConfigusPort::Builder.new(*args, &block)
    @result = ConfigusPort::Config.new(result.result)
  end
  def self.result
    @result
  end
  # Your code goes here...
end

module Kernel
  def config
    ConfigusPort.result
  end
end
