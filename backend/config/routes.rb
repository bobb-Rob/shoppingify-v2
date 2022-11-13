Rails.application.routes.draw do
  root 'items#index'

  use_doorkeeper
  devise_for :users
  resources :items
  
  draw :api
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
