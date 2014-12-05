Rails.application.routes.draw do
  root 'users#index'

  resources :users do
  end
end
