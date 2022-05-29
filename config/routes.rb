Rails.application.routes.draw do
  devise_for :users
  root 'baggages#index'
  resources :baggages, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resources :deliveries, only: [:index, :create]
  end
end
