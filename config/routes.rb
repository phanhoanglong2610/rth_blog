Rails.application.routes.draw do
  root to: 'visitors#index'

  get 'visitors/index'
  get 'pages/about'
  get 'pages/contact'

  resources :categories
  resources :comments
  resources :posts
  devise_for :users
  resources :users
  resources :visitors
end
