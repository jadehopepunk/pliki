require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NodesController, "when displaying new node form" do
  integrate_views
  
  it "should display page" do
    get :new, :permalink => 'new-page'
    response.should be_success
  end
  
  it "should load new node permalink" do
    get :new, :permalink => 'new-page'
    assigns(:node).should_not be_nil
    assigns(:node).permalink.should == 'new-page'
  end
  
end