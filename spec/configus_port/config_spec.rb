require File.expand_path('spec/spec_helper')

describe "ef" do
  context "develop" do
    it "should" do
      config.each_pair do |key, value|
        puts "#{key}: #{value}"
      end
      config.should be
      config.bar.should == "foo"
      config["bar"].should == "foo"
      config.key.should == "value"
      config.sections.first.should == 'another_value'
      config["sections"][:first].should == 'another_value'
      config.sections.second.should == 'second_value'
      config.sections.block.value.should == 'value'
      config.without_value.should be_nil
    end
  end
end
