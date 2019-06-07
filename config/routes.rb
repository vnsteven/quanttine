Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'users'
  resources :users do
    resources :profiles
  end

  devise_for :admins, path: 'admins'
  resources :admins, only: [:show, :index]

  resources :payments, only: [:new]
  resources :charge_payments, only: [:new, :create]
  resources :subscription_payments, only: [:new, :create]
end
