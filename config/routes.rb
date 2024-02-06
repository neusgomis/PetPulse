Rails.application.routes.draw do
  # get 'dashboard/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/dashboard', to: 'dashboard#show'

  resources :pets do
    resources :bookings
    resources :records
    resources :posts
    resources :messages, only: [:show, :create]

    member do
      get 'records', to: 'pets#index'
      get 'posts', to: 'pets#show'
      get 'dashboard', to: 'dashboard#index'
      get 'messages', to: 'pets#messages'
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
