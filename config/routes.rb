Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # REGISTRATION / LOGIN
  resource :session
  resource :registration
  resource :password_reset
  resource :password

  get "dashboard" => "main#show"


  resources :resource_groupes, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :resources, only: [ :index, :new, :create, :edit, :update, :destroy, :show ]

  
  # Defines the root path route ("/")
  root "main#index"

end
