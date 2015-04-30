Rails.application.routes.draw do
  resources :restaurants

  root to: 'visitors#index'
  get '/find' => 'find#search', :as => 'find' 
  devise_for :users
  resources :users
end
