Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  devise_for :admins
a
  resources :users, only: [:index, :show] do
	resources :profiles
  end

  resources :admins, only: [:show, :edit] do
    resources :dashboard, only: [:index]
  end
end
