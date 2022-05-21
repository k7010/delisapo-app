Rails.application.routes.draw do
  root to: "baggages#index"
  resources :baggages, only: [:index, :new, :create]
end
