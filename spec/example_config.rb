ConfigusPort.build :development do
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
    sections do
      first 'another_value'
    end
  end
end
