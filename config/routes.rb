Rails.application.routes.draw do
  root 'mypages#index'

  resources :users do
  end

  resources :mypages do
  end

  resources :settings do
  end
end
