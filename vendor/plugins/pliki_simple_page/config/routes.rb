PluginInstances::RouteSetManager.routes_for('pliki_simple_page').draw do |map|
    
  map.resource :simple_page
  map.root :controller => 'simple_pages', :action => 'show'  
  
end
