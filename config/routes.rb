Rails.application.routes.draw do
  root 'mypages#index'

  resources :users do
  end

  resources :mypages do
  end

  scope :settings do
    resources :manual_registrations do
    end

    resources :auto_registrations do
    end

    resources :filters do
    end

    resources :profiles do
    end
  end
end
