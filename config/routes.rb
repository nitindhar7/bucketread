ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "dashboard", :action => :welcome
  
  map.resources :users, :member => { :logout => :get }, :path_names => { :new => "signup" }
  map.resources :pages, :member => { :finish => :get, :again => :get, :tweet => :get }

  map.login "login", :controller => :users, :action => :login
  map.authorize "authorize", :controller => :users, :action => :authorize
  map.api_authorize "authorize.:format", :controller => :users, :action => :authorize, :format => :format
  map.dashboard "dashboard", :controller => :dashboard
  map.faq "faq", :controller => :dashboard, :action => :faq

  map.connect '/auth/failure', :controller => :users, :action => :failure
  map.connect "/auth/:provider", :controller => :users, :action => :blank
  map.connect "/auth/:provider/callback", :controller => :users, :action => :login_with_twitter
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
