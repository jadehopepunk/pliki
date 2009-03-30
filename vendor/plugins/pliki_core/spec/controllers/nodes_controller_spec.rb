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

describe NodesController, "when creating node" do
  integrate_views
  
  it "should redirect to node path if node is valid" do
    post :create, :pliki_node => {:plugin_name => 'simple_page', :permalink => 'some-page', :name => 'Simple Page'}
    response.should redirect_to("/pages/some-page")
  end
  
  it "should redisplay new form if node is invalid" do
    post :create, :pliki_node => {}
    response.should render_template('new')
  end
  
  it "should create a node" do
    post :create, :pliki_node => {:plugin_name => 'simple_page', :permalink => 'some-page', :name => 'Simple Page'}
    Pliki::Node.find_by_permalink('some-page').should_not be_nil
  end

end