Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root to: 'pages#home'
  # Active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Devise
  devise_for :users, path_names: { 'sign_in': 'login', 'sign_out': 'logout' }

  # App custom routes
  resources :hikes
  resources :profiles, only: :update
  resources :passwords, only: :update

  get :account, to: 'account#account'

  scope '/account' do
    get :hikes, to: 'account#hikes', as: 'account_hikes'
    get :password, to: 'account#password', as: 'account_password'
  end

  get '/:id', to: 'pages#show'
end
