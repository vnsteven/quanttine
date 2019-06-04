Rails.application.routes.draw do
  root 'home#index'
  resources :dashboard
  devise_for :admins


##### FACEBOOK CONNECT #####
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
