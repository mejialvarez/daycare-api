require 'api_constraints'

Rails.application.routes.draw do
  root 'activity_logs#index'

  resources :activity_logs, only: [:index]

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :activities, only: [:index]
      resources :activity_logs, only: [:create] do
        put :finish, on: :member
      end
      resources :babies, only: [:index] do
        resources :activity_logs, only: [:index]
      end
    end
  end
end
