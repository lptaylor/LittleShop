Rails.application.routes.draw do

  root 'root#index'

  resources :users
  resources :merchants, only: [:index]
  resources :cart, only: [:index, :show]
  resources :login, only: [:index]
  resources :register, only: [:index]
  resources :items
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
