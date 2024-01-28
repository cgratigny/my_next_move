Rails.application.routes.draw do
  resources :quotes
  resources :tabular_data
  resources :daily_opportunity_stats, only: :index

  resources :blank_turbo_frames, only: :show
  resources :companies

  resource :dashboard, only: :show

  resources :documents

  resources :moves do
    resources :metrics
    resources :notes
    resources :opportunity_metrics
  end

  resources :notes

  resources :opportunities do
    resources :notes
    resources :tasks
  end

  resources :tasks do
    resources :notes
  end

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  root "dashboards#show"
end
