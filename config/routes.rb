Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
 resources :users, only: [] do
  collection do
    get :pet_calender
  end
 end
  resources :pets do
    resources :bookings, only: [:create, :new, :show, :index]
    resources :records
    resources :posts
    resources :messages, only: [:create]
  end
   resources :bookings, only: [:destroy, :show, :create]
  get '/dashboard', to: 'pages#dashboard'
  get '/about', to: 'abouts#about'
  get '/faq', to: 'faqs#faq'
  get '/contact', to: 'contacts#contact'
end
