ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "dashboard", :action => :welcome
  
  map.resources :users, :member => { :logout => :get }, :path_names => { :new => "signup" }
  map.resources :pages, :member => { :finish => :get, :again => :get }

  map.login "login", :controller => :users, :action => :login
  map.authorize "authorize", :controller => :users, :action => :authorize
  map.api_authorize "authorize.:format", :controller => :users, :action => :authorize, :format => :format
  map.dashboard "dashboard", :controller => :dashboard

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
