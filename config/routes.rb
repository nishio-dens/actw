Rails.application.routes.draw do
  root 'my_pages#index'

  resources :users do
  end

  resources :my_pages do
  end

  resources :settings do
  end
end
