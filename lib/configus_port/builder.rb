module ConfigusPort
  class Builder

    def new(env, &block)
      @app_env = env
    end

    def build(env, &block)
      @env = env
      instance_eval(&block)
      @config = {}
    end

    def env(env, options = {}, &block)

    end

    def method_missing(m)
      raise m.inspect

    end
  end
end
