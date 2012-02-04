module ConfigusPort
  class Builder

    def initialize(env, &block)
      @envs = {}
      @config = {}
      @app_env = env
      instance_eval &block
      env_call(env)
    end

    def result
      @config
    end

    def env_call(env)
      if @envs[env][:parent]
        env_call @envs[env][:parent]
      end
      proxy = ConfigusPort::Proxy.new(@config, &@envs[env][:block])
      @config = proxy.result
    end

    def env(env, options = {}, &block)
       @envs[env] = {
         :parent => options[:parent],
         :block => block
       }
    end
  end
end
