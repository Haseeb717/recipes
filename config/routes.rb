Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: {format: 'json'} do
  	namespace :v1 do
      resources :users do
        collection do
          post 'signin'
        end
      end

      resources :recipes do
        collection do
          get 'five_minutes_recipes'
          get 'max_15_min_recipe'
        end
      end

      get 'cuisnes' => 'home#cuisnes'
      get 'meal_types' => 'home#meal_types'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
