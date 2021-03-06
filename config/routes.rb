Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :users, only: [:index]
  resources :users do
    get 'logout', on: :collection
    get 'profile', on: :collection
  end
  resources :users, only: [:index,:show]
  resources :items, only: [:index,:new]
  resources :creditcards, only: [:index]
  resources :items_buy_confirms, only: [:index]
end
