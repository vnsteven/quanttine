Rails.application.routes.draw do
  root 'home#index'
  resources :dashboard
  resources :user, only: [:show]
  devise_for :users
  devise_for :admins

end
