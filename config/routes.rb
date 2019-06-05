Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'users'
  devise_for :admins, path: 'admins'
  # resources :users, only: [:show, :edit]

  resources :users, only: [:show, :edit] do
    resources :dashboard, only: [:index]
  end

  resources :admins, only: [:show, :edit] do
    resources :dashboard, only: [:index]
  end


end
