Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get 'pages/welcome'
  get 'about', to: 'pages#about'
  resources :worklogs, only: [:index, :create]

  root to: 'pages#welcome'
end
