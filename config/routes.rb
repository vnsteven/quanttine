Rails.application.routes.draw do
  root 'home#index'
  resources :dashboard
  resources :user, only: [:show]
  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :admins

end
