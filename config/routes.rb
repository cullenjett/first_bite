Rails.application.routes.draw do
  root 'products#index'
  get 'ui(/:action)', controller: 'ui'

  resources :products, only: [:index, :new, :create, :edit, :update]
  resources :categories, only: [:show]

  resources :users, only: [:create]
  get '/register', to: 'users#new'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
