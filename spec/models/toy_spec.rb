require 'spec_helper'

describe Toy do
  before(:each) do
    @toy = Toy.new(:description => "Lost Bear Bear", :status => "LOST")
  end

  it "should be valid with sample data" do
   @toy.should be_valid
  end
  
  it "should require a description" do
    @toy.description = ''
    @toy.should_not be_valid
  end
  
  it "should require a status" do
    @toy.status = ''
    @toy.should_not be_valid
  end
  
  it "should require a status that's either LOST or FOUND" do
    @toy.status = 'Misc'
    @toy.should_not be_valid
    
    @toy.status = 'LOST'
    @toy.should be_valid
    
    @toy.status = 'FOUND'
    @toy.should be_valid
  end
end
