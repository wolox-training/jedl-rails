Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :books, only: %I[index show] do
        collection do
          get 'search/:search', to: 'books#search', as: 'search'
        end
      end

      resources :users, only: [] do
        resources :rents, only: %I[index create]
      end

      resources :book_suggestions, only: %I[create]
    end
  end
end
