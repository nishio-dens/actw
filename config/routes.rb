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
    resources :auto_registrations
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
end
