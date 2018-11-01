Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :books, only: %I[index show]

      scope 'users/:user_id' do
        resources :rents, only: %I[index create]
      end
    end
  end
end
