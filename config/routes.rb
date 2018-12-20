Rails.application.routes.draw do

  root 'root#index'

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :merchants, only: [:show]
    resources :orders, only: [:show]
  end

  namespace :dashboard do
    resources :orders, only: [:show]
    resources :items, only: [:index, :new, :create, :show, :edit]
  end

  resources :users, only: [:create, :edit] do
    resources :orders, only: [:show]
  end

  resources :items
  resources :orders

  resource :cart, only: [:show, :create]

  get '/register', to: "users#new"
  get '/profile', to: "users#show"
  get '/merchants', to: "users#index"
  patch "/profile/edit", to: "users#edit"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/profile/orders', to: "orders#index"
  get "/profile/orders/#{:id}", to: "orders#show"
  get '/dashboard', to: 'dashboard#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
