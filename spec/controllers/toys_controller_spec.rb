require 'spec_helper'

describe ToysController do

  describe "GET 'new'" do
		before(:each) do
		  @toy = mock_model(Toy, :build => @toy)
		  @user = mock_model(User, :toys => @toy)
		  controller.stub!(:current_user).and_return(@user)
	  end
    describe "with request for LOST" do
      it "should render the lost template" do
        get 'new', {:type => "LOST"}
        response.should render_template("lost")
      end
    end
  
    describe "with request for FOUND" do
      it "should render the found template" do
        get 'found', {:type => "FOUND"}
        response.should render_template('found')
      end
    end
  end

end
