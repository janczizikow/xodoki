Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # Root
  root to: 'pages#home'

  # Active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Devise
  devise_for :users, path_names: { 'sign_in': 'login', 'sign_out': 'logout' }

  # App custom routes
  resources :hikes, only: %i[show new create edit update destroy] do
    resources :favorites, only: %i[create destroy]
  end

  resources :profiles, only: :update
  resources :passwords, only: :update
  resources :favorites, only: :index


  get :account, to: 'account#account'
  scope '/account' do
    get :hikes, to: 'account#hikes', as: 'account_hikes'
    get :password, to: 'account#password', as: 'account_password'
  end

  get '/xodoki', to: 'pages#users', as: 'users'
  get '/:id', to: 'pages#show'
end
