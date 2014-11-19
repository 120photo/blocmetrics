Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  resources :websites
  resources :verifications, only: [:update]
  resources :api_keys, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :events, only: [:create]
    end
  end

end
