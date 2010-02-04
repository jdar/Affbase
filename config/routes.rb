ActionController::Routing::Routes.draw do |map|
  map.resources :events
  map.connect 'affiliates/list', :controller => "affiliates", :action => "list"  
  map.connect 'affiliates/regenerate_thumb/:id', :controller => "affiliates", :action => "regenerate_thumb"
  map.find_by_state 'affiliates/state/:id.:format', :controller => "affiliates", :action => "find_by_state"
  map.find_by_name 'affiliates/abbr/:id.:format', :controller => "affiliates", :action => "find_by_abbr"
  map.connect 'affiliates/getfeed', :controller => "affiliates", :action => "feed"
  map.resources :affiliates, :has_many => :events 

  map.connect ":controller/:action"
  map.connect '', :controller => "affiliates" 
  map.connect ":controller/:action/:id"
  map.connect ":controller/:action/:id/:format"
end
