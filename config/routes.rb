Rails.application.routes.draw do
  root to: 'home#index'
  get 'setup', to: 'home#setup'

  # omniauth callbacks
  get '/auth/create', to: 'auth#create'
  get '/auth/:provider/callback', to: 'auth#callback'
  post '/auth/connect', to: 'auth#connect_to_guest_user'
  get '/complete', to: 'home#complete'
  
  # Imports
  post 'imports/create', to: 'imports#create'

  # ActiveAdmin stuff
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
