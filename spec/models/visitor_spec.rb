require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Visitor do
  before(:each) do
    @valid_attributes = {
      :username => 'ignu',
      :channel => 'main.html'   
    }
  end

  it "should create a new instance given valid attributes" do
    Visitor.create!(@valid_attributes)
  end
end
