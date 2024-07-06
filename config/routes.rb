Rails.application.routes.draw do
  get 'shopping_lists/index'
  devise_for :users

  resources :meals
  resources :ingredients
  resources :meal_plans
  resources :shopping_lists, only: [:index]

  root 'meal_plans#index'
end
