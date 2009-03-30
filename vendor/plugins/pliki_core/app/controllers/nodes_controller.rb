class NodesController < ApplicationController
  
  def new
    @node = Pliki::Node.new(:permalink => params[:permalink])
  end
  
  def create
    @node = Pliki::Node.create(params[:pliki_node])
    
    if @node.new_record?
      render :action => :new
    else
      redirect_to "/pages/#{@node.to_param}"
    end
  end
  
end