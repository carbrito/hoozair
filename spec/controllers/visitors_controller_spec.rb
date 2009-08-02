require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VisitorsController do

  #Delete this example and add some real ones
  it "should use VisitorsController" do
    controller.should be_an_instance_of(VisitorsController)
  end

  describe "when pinged by a user"
    user_name = 'ignu'
    channel = 'home'

    before(:each) do
      visitor = mock_model(Visitor);
      other_visitors = mock_model(Array)
      Visitor.should_receive(:find_or_create_by_username).with(user_name).and_return(visitor)
      visitor.should_receive(:save!)
      Visitor.should_receive(:find_by_channel).with(channel).and_return(other_visitors)
      other_visitors.should_receive(:to_json)
      post(:ping, {:user_name =>user_name, :channel => channel})
    end

    should_respond_with_content_type :json      

end

describe VisitorsController, "routing" do

  it "should route /visitors/ping to ping" do
    post "/visitors/ping"
  end
end

