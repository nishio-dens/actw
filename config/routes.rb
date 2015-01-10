Rails.application.routes.draw do
  root 'mypages#index'

  devise_for :users, controllers: {
    sessions:      "users/sessions",
    registrations: "users/registrations",
    passwords:     "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index] do
    resources :user_filters, only: [:show]
    resources :user_genres, only: [:show]
  end

  resources :mypages, only: [:index]

  scope :settings do
    resources :manual_registrations, only: [:new, :create, :edit, :update, :destroy]
    resources :auto_registrations do
      member do
        post :execute_coordination
      end
    end

    namespace :auto_registrations do
      resources :rss, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :filters do
      member do
        put :sort
      end
    end
    resources :profiles
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :filters, only: [:show]
    end
  end

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
