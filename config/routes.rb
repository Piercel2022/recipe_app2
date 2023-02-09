# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'

  resources :users, only: %i[index show]

  resources :recipes, only: %i[index show new create destroy] do
    resources :recipefoods, only: %i[index show new create destroy]
    resources :general_shopping_list, only: %i[index]
  end

  resources :foods, only: %i[index show new create destroy] do
  end

  get 'public_recipes', to: 'recipes#public', as: 'public_recipes'
end
