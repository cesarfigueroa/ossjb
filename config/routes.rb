Rails.application.routes.draw do
  constraints Constraints::LoggedIn do
    get :logout, :to => 'sessions#destroy', :as => :logout
    root :to => 'dashboard#index', :as => :logged_in_root
  end

  root :to => 'home#index'

  get :login, :to => 'sessions#new', :as => :login
  get :callback, :to => 'sessions#create'
end
