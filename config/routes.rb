Rails.application.routes.draw do
  root 'home#index'
  resources :dashboard
  devise_for :users


end
