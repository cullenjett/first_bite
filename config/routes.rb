Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  resources :products, only: [:index, :new, :create]
end
