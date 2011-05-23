ActionController::Routing::Routes.draw do |map|
  
  map.resources :users
  map.resources :pages

  map.root :controller => "dashboard"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
