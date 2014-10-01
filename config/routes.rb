Rails.application.routes.draw do
  root 'products#index'
  get 'ui(/:action)', controller: 'ui'

  resources :products, only: [:index, :new, :create, :edit, :update]
  resources :categories, only: [:show]

  resources :orders, only: [:show, :update]
  resources :order_items, only: [:create, :update]

  resources :users, only: [:create]
  get '/register', to: 'users#new'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
