ActionController::Routing::Routes.draw do |map|
  map.connect 'affiliates/list', :controller => "affiliates", :action => "list"  
  map.connect 'affiliates/regenerate_thumb/:id', :controller => "affiliates", :action => "regenerate_thumb"
  map.resources :affiliates

  map.connect ":controller/:action"
  map.connect '', :controller => "affiliates" 
  map.connect ":controller/:action/:id"
  map.connect ":controller/:action/:id/:format"
end
