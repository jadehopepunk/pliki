class NodesController < ApplicationController
  
  def new
    @node = Pliki::Node.new(:permalink => params[:permalink])
  end
  
end