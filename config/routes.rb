Rails.application.routes.draw do
  get 'default_categories', to: 'default_categories#index'
  get 'default_items', to: 'default_items#index'
  root 'client#index'

  use_doorkeeper
  devise_for :users

  draw :api
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
