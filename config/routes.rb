Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'users'
  devise_for :admins, path: 'admins'

  resources :users do
    resources :avatars, only: [:create]
    resources :user_meals
    resources :profiles do
      resources :school_meals, only: [:show]
    end
  end



  resources :admins, only: [:show] do
    resources :school_meals, only: [:new, :create, :index, :edit, :upgrade, :destroy]
    resources :statistics, only: [:index]
    resources :profiles, only: [:index]
  end

end



