Rails.application.routes.draw do

  root 'root#index'

  resources :users, only:[:index, :create, :show]
  resources :merchants, only: [:index]
  resources :cart, only: [:index, :show]
  resources :login, only: [:index]
  resources :items
  resources :orders

  get '/register', to: "users#new"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
