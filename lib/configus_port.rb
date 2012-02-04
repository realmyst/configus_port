require "configus_port/version"

module ConfigusPort
  autoload "Config", "configus_port/config"
  autoload "Builder", "configus_port/builder"

  def self.build(*args, &block)
    ConfigusPort::Builder.build(*args, &block)
  end
  # Your code goes here...
end

module Kernel
  def config
    ConfigusPort::Config
  end
end
