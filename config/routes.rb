Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'users'
  resources :users do
    resources :profiles
  end

  devise_for :admins, path: 'admins'
  resources :admins, only: [:show, :index]

  resources :payments
  resources :charge_payments
  resources :subscription_payments
end
