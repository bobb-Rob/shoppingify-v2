namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: 'registrations#create'
      # post 'sign_in', to: 'sessions#create'
    end
    resources :items
    resources :categories
    resources :records
    resources :lists
    # get default categories only index
    resources :default_categories, only: %i[index]
    get 'list/active', to: 'lists#active'
    get 'users/current', to: 'users#current'
  end
end

scope :api do
  scope :v1 do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
end
