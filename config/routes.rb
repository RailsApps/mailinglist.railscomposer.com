Rails.application.routes.draw do
  resources :api, only: [:create]
  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'
end
