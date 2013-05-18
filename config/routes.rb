Authproviders::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:new, :destroy, :show, :index]
  resources :posts
  resources :admin
  root :to => 'posts#index'
  match "/unapproved" => "posts#unapproved"
  #match "users/auth/twitter" => "users/omniauth_callbacks#twitter"
  #match "/signout" => "sessions#destroy", :as => :signout
end
