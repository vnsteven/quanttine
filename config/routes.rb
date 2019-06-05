Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :users do
    resources :profiles do
      resources :join_table_profile_preferences
    end
  end

  devise_for :admins
  resources :admins do
  end


end
