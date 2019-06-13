Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  root 'home#index'

  devise_for :users, path: 'users'
  resources :users do
    resources :avatars, only: [:create]
    resources :profiles do
      resources :user_meals
      resources :school_meals, only: [:show]
    end
  end

  devise_for :admins, path: 'admins'
  resources :admins do
    resources :daily_services
    resources :preparing_user_meals
    resources :food_supply
    resources :servings
    resources :quantities
    resources :school_meals, only: [:destroy]
    resources :profiles, only: [:index]
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all


  resources :api, only: [:create]
  resources :payments, only: [:new]
  resources :monthly_payments, only: [:new, :create, :update]
  resources :yearly_payments, only: [:new, :create, :update]

end
