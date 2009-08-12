require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VisitorsController do

  #Delete this example and add some real ones
  it "should use VisitorsController" do
    controller.should be_an_instance_of(VisitorsController)
  end

  describe "when pinged by a user"
    username = 'ignu'
    channel = 'home'

    response = nil

    before(:each) do
      visitor = mock_model(Visitor);
      other_visitors = mock_model(Array)


      Visitor.should_receive(:find_or_create_by_username).with(username).and_return(visitor)
      visitor.should_receive(:channel=).with('home')
      visitor.should_receive(:save!)
      Visitor.should_receive(:find_all_by_channel).with(channel).and_return(other_visitors)
      other_visitors.should_receive(:to_json).and_return(["Ignu", "Fred"])
      response = post(:ping, {:username =>username, :channel => channel})
    end

    it "should respond with a json version of the current visitors" do
      response.content_type.should == 'application/json'
      response.body.should match "Ignu"
      response.body.should match "Fred"
    end

    # TODO: why doesn't this work'
    # should_respond_with_content_type(:rss)
    #should_respond_with_content_type :json

end

describe VisitorsController, "routing" do

  it "should route /visitors/ping to ping" do
    post "/visitors/ping"
  end
end

