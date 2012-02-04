ConfigusPort.build :test do
  env :production do
    key 'value'
    foo 'bar'
    sections do
      first 'first_value'
      second 'second_value'
    end
  end

  env :development, :parent => :production do
    bar 'foo'
    foo 'foobar'
    nil_value nil
    false_value false
    without_value
    sections do
      first 'another_value'
    end
  end

  env :test, :parent => :development do
    sections do
      block do
        value "value"
      end
    end
  end
end
