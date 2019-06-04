Rails.application.routes.draw do
  root 'home#index'
  resources :user, only: [:show]
  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :admins

  resources :users do
    resources :dashboard
  end

end
