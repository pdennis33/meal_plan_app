class Meal < ApplicationRecord
  has_many :ingredients_meals
  has_many :ingredients, through: :ingredients_meals
  has_many :meals_meal_plans
  has_many :meal_plans, through: :meals_meal_plans
end
