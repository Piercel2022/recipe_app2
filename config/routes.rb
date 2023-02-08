# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'

  resources :users, only: %i[index show]

  resources :recipes, only: %i[index show new create destroy] do
    resources :recipefoods, only: %i[index show]
  end
end
