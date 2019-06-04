Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  devise_for :admins

  resources :users, only: [:show, :edit] do
    resources :dashboard, only: [:index]
  end

  resources :admins, only: [:show, :edit] do
    resources :dashboard, only: [:index]
  end

  resources :users, only: [:show, :edit]


##### FACEBOOK CONNECT #####
# devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: "registrations" }

# devise_scope :users do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
