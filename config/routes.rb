Rails.application.routes.draw do
  devise_for :users,
              path: 'api/v1/auth',
              path_names: {
                'sign_in': 'login',
                'sign_out': 'logout'
              },
              defaults: {
                format: :json
              }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :hikes, only: %i[index show create update destroy]
    end
  end
end
