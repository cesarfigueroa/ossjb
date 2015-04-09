Rails.application.routes.draw do
  root :to => 'sessions#hi'

  # Refactor to use #resources
  get 'sessions/new', :to => 'sessions#new'
  get 'callback', :to => 'sessions#callback'
  get :logout, :to => 'sessions#destroy'
end
