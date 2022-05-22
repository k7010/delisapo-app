Rails.application.routes.draw do
  devise_for :users
  root to: "baggages#index"
  resources :baggages, only: [:index, :new, :create, :show] do
    resources :deliveries, only: [:index, :create]
  end
end
