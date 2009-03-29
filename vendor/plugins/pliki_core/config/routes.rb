ActionController::Routing::Routes.draw do |map|

  map.resources :nodes
  map.connect "/nodes/new/:permalink", :controller => 'nodes', :action => 'new'

end
