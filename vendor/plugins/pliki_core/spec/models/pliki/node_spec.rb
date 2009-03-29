require File.expand_path(File.dirname(__FILE__) + '/.././../spec_helper')

module Pliki
  describe Node do
  
    it "should set name if permalink is set and name is nil" do
      Node.new(:permalink => 'some-page').name_from_permalink.should == 'Some Page'
    end
  
  end
end