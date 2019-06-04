Rails.application.routes.draw do
  root 'home#index'
  resources :dashboard
  devise_for :users
  devise_for :admins

end
