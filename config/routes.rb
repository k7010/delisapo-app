Rails.application.routes.draw do
  devise_for :users
  root to: "baggages#index"
  resources :baggages, only: [:index, :new, :create]
end
