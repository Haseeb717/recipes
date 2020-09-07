Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: {format: 'json'} do
      resources :users do
        collection do
          post 'signin'
        end
      end

      resources :users do
        collection do
          get 'five_minutes_recipes'
          get 'max_15_min_recipe'
        end
      end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
