Rails.application.routes.draw do

  root 'root#index'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :merchants, only: [:show, :index, :update]
    resources :orders, only: [:show, :destroy]
  end

  namespace :dashboard do
    get '/', to: "users#show"
    resources :items do
      member do
        post '/toggle_active', to: 'items#toggle_active', as: 'toggle'
      end
    end
    resources :orders, only: [:show]
  end

  get '/profile', to: 'users#show'
  get "/profile/edit", to: "users#edit"

  namespace :profile do
    resources :orders, only: [:show, :index, :create]
  end


  resources :users, only: [:create, :edit, :update] do
    resources :orders, only: [:index, :show]
  end

  resources :items
  resources :orders

  # resource :cart, only: [:create, :index]
  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#index'
  delete '/cart', to: 'carts#destroy'
  post 'cart/:id/add',   to: 'carts#add_item'
  post 'cart/:id/subtract', to: 'carts#minus_item'

  get '/register', to: "users#new"

  get '/merchants', to: "users#index"


  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
