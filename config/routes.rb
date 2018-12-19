Rails.application.routes.draw do

  root 'root#index'

  namespace :admin do
    resources :users, only: [:index]
  end

  resources :users, only: [:create, :edit] do
    resources :orders, only: [:index, :show]
  end
  resources :merchants, only: [:index]
  resources :items
  resources :orders

  resource :cart, only: [:show]

  get '/register', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/profile', to: "users#show"
  get '/profile/orders', to: "orders#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
