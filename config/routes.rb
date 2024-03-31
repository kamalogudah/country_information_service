Rails.application.routes.draw do
  apipie
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    namespace :v1 do
      resources :countries
    end
  end
  resources :countries
  # Defines the root path route ("/")
  root "home#index"
  get 'admin/index'
  post 'restore_record/create'
  post 'soft_delete_record/create'
end
