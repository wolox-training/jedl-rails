Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'books', to: 'books#index'
      get 'books/:id', to: 'books#show'

      get 'users/:user_id/rents', to: 'rents#index'
      post 'users/:user_id/rents', to: 'rents#create'
    end
  end
end
