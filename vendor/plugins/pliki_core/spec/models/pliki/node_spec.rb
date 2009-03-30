require File.expand_path(File.dirname(__FILE__) + '/.././../spec_helper')

module Pliki
  describe Node do
  
    it "should be able to load name from permalink" do
      Node.new(:permalink => 'some-page').name_from_permalink.should == 'Some Page'
    end
    
    it "should set name from permalink when saving" do
      node = Factory.build(:node, :permalink => 'some-page')
      node.save!
      node.name.should == 'Some Page'
    end
    
  end
end