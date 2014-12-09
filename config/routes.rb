Rails.application.routes.draw do
  root 'users#index'

  resources :users do
  end

  resources :settings do
  end
end
