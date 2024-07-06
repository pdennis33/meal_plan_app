class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meals_meal_plans
  has_many :meals, through: :meals_meal_plans
end
