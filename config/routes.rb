Rails.application.routes.draw do
  root to: 'home#index'

  # omniauth callbacks
  get '/auth/:provider/callback', to: 'auth#callback'

  # Imports
  post 'imports/create', to: 'imports#create'

  # ActiveAdmin stuff
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
