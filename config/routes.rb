Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'users'
  devise_for :admins, path: 'admins'

  resources :users do
    resources :avatars, only: [:create]
    resources :profiles
    resources :school_meals, only: [:index]
  end


  resources :admins, only: [:show] do
    resources :school_meals, only: [:new, :create, :edit, :upgrade, :destroy]
    resources :statistics, only: [:index]
    resources :profiles, only: [:index]
  end

end

##### FACEBOOK CONNECT #####
# devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: "registrations" }

# devise_scope :users do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end



