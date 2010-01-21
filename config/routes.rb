ActionController::Routing::Routes.draw do |map|
  map.connect 'affiliates/list', :controller => "affiliates", :action => "list"  
  map.resources :affiliates

  map.connect ":controller/:action"
  map.connect '', :controller => "affiliates" 
  map.connect ":controller/:action/:id"
  map.connect ":controller/:action/:id/:format"
end
