Rails.application.routes.draw do
  resources :restaurants

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
