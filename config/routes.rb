Rails.application.routes.draw do

  root 'root#index'

  namespace :admin do
    resources :users, only: [:index]
  end

  get '/dashboard', to: 'dashboard#show'
  namespace :dashboard do
  end

  resources :users, only: [:create, :edit] do
    resources :orders, only: [:index, :show]
  end

  resources :merchants, only: [:index]
  resources :items
  resources :orders

  resource :cart, only: [:show, :create]

  get '/register', to: "users#new"
  get '/profile', to: "users#show"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/profile/orders', to: "orders#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
