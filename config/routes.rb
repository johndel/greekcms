ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.admin 'admin', :controller => 'admin'
  map.search 'search', :controller => 'pages', :action => 'search'

  map.with_options :controller => 'contact' do |contact|
  contact.contact '/contact',
    :action => 'new',
    :conditions => { :method => :get }

  contact.contact '/contact',
    :action => 'create',
    :conditions => { :method => :post }
end

  map.resource :contact
  map.resources :sessions
  map.resources :users
  map.resources :pages
  map.root :controller => 'pages', :action => 'show', :id => 3
  map.static ':permalink', :controller => 'pages', :action => 'show'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
