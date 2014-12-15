Rails.application.routes.draw do
  root 'mypages#index'

  resources :users, only: [:index]

  resources :mypages, only: [:index]

  scope :settings do
    resources :manual_registrations, only: [:new, :create, :edit, :update, :destroy]
    resources :auto_registrations
    resources :filters
    resources :profiles
  end
end
