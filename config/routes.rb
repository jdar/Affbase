ActionController::Routing::Routes.draw do |map|

  map.connect ":controller/:action"
  map.resources :affiliates
  map.connect '', :controller => "affiliates" 
  map.connect ":controller/:action/:id"
  map.connect ":controller/:action/:id/:format"
end
