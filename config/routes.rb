require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :activities, only: [:index]
      resources :babies, only: [:index] do
        resources :activity_logs, only: [:index]
      end
    end
  end
end
