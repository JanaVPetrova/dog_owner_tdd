Authproviders::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:new, :destroy, :show]
  root :to => 'users#new'
end
