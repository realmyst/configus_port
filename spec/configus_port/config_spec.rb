require File.expand_path('spec/spec_helper')

describe "ef" do
  context "develop" do
    it "should" do
      config.should be
      config.bar.should == "foo"
      config.sections.first.should == 'another_value'
    end
  end
end
