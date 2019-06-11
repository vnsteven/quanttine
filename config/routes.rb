Rails.application.routes.draw do
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
  resources :admins, only: [:show] do
    resources :preparing_user_meals
    resources :food_supply
    resources :servings
    resources :quantities
    resources :school_meals, only: [:destroy]
    resources :profiles, only: [:index]
  end

  resources :payments, only: [:new]
  resources :monthly_payments, only: [:new, :create, :update]
  resources :yearly_payments, only: [:new, :create, :update]
end
