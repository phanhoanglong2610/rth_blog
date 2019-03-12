Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contact'
  resources :categories
  resources :comments
  resources :posts
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
