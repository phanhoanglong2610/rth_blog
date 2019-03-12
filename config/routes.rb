Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :posts
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
