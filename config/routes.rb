ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "dashboard", :action => :welcome
  
  map.resources :users, :member => { :logout => :get }
  map.resources :pages, :member => { :read => :get, :unread => :get, :tweet => :get }
  map.resources :photos, :member => { :nav_thumbnail => :get }

  map.login "login", :controller => :users, :action => :login
  map.signup "signup", :controller => :users, :action => :new
  map.authorize "authorize", :controller => :users, :action => :authorize
  map.api_authorize "authorize.:format", :controller => :users, :action => :authorize, :format => :format
  map.account "account", :controller => :users, :action => :edit
  map.dashboard "dashboard", :controller => :dashboard
  map.features "features", :controller => :dashboard, :action => :features
  map.faqs "faqs", :controller => :dashboard, :action => :faqs
  map.api "api", :controller => :dashboard, :action => :api

  map.connect "/auth/failure", :controller => :users, :action => :failure
  map.connect "/auth/:provider", :controller => :users, :action => :blank
  map.connect "/auth/:provider/callback", :controller => :users, :action => :login_with_twitter
  map.connect "dashboard/pages", :controller => :dashboard, :action => :pages

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
