Rails.application.routes.draw do

  root 'root#index'

  resources :users, only:[:index, :create]
  resources :merchants, only: [:index]
  resources :items
  resources :orders

  resource :cart, only: [:show]

  get '/register', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/profile', to: "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
