Rails.application.routes.draw do
  root 'products#index'
  get 'ui(/:action)', controller: 'ui'

  resources :products, only: [:index, :new, :create, :edit, :update]
end
