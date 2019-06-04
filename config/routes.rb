Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :users do
    resources :dashboard
  end

  resources :admins do
    resources :dashboard
  end

  resources :users, only: [:show, :edit]

  devise_for :admins

##### FACEBOOK CONNECT #####
# devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: "registrations" }

# devise_scope :users do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
