Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  resources :websites
  resources :verifications, only: [:update]
  resources :api_keys, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :events, only: [:create]
      match 'events.json' => "events#create", via: :options, as: :events_options
    end
  end

  require 'sidekiq/web' # sidekiq monitoring app
  mount Sidekiq::Web => '/sidekiq' # sidekiq monitoring app

end
