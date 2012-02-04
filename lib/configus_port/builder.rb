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
      if (@envs[env][:parent]) 
        env_call(@envs[env][:parent])
      end 
      build(@envs[env][:block])
    end
                   
    def build(block,config)
      instance_eval(&block)
    end

    def env(env, options = {}, &block)
       @envs[env] = {
         :parent => options[:parent], 
         :block => block
       } 
    end

    def method_missing(m, *args, &block)
      if block_given?
        @config[m] = build(block)
      else  
        @config[m] = args.first
      end   
    end
  end
end
