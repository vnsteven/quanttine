Rails.application.routes.draw do
  root 'home#index'
  resources :dashboard
  resources :user, only: [:show, :index]

  devise_for :admins

##### FACEBOOK CONNECT #####
#devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: "registrations" }

# devise_scope :users do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
