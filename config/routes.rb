Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard" => "main#show"
  root "main#index"

  resources :resource_groupes, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :resources, only: [ :index, :new, :create, :edit, :update, :destroy, :show ]
end
