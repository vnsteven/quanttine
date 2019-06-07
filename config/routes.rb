Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'users'
  resources :users do
    resources :avatars, only: [:create]
    resources :profiles
  end


  resources :admins, only: [:show] do
    resources :school_meals
    resources :statistics, only: [:index]
    resources :profiles, only: [:index]
  end

  resources :payments, only: [:new]
  resources :charge_payments, only: [:new, :create]
  resources :subscription_payments, only: [:new, :create]
end

##### FACEBOOK CONNECT #####
# devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: "registrations" }

# devise_scope :users do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end
