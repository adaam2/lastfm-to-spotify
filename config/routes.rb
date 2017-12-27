Rails.application.routes.draw do
  root to: 'home#index'

  # omniauth callbacks
  get '/auth/:provider/callback', to: 'auth#callback'
  post 'auth/connect', to: 'auth#connect_to_guest_user'

  namespace :api do
    post 'imports/create', to: 'imports#create'
  end

  # ActiveAdmin stuff
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
