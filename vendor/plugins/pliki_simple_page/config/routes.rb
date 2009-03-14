Pliki::PluginRouteSetManager.routes_for('pliki_simple_page').draw do |map|
    
  map.namespace :pliki_simple_page do |pliki_simple_page|
    pliki_simple_page.resource :simple_page
  end
  
  map.root :controller => 'pliki_simple_page/simple_pages', :action => 'show'  
  
end
