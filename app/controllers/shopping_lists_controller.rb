class ShoppingListsController < ApplicationController
  def index
    @start_date = params[:start_date] || Date.today
    @end_date = params[:end_date] || Date.today + 7.days
    @meal_plans = current_user.meal_plans.where(date: @start_date..@end_date)
    @shopping_list = generate_shopping_list(@meal_plans)
  end

  private

  def generate_shopping_list(meal_plans)
    shopping_list = Hash.new(0)
    meal_plans.each do |meal_plan|
      meal_plan.meals.each do |meal|
        meal.ingredients_meals.each do |ingredient_meal|
          ingredient = ingredient_meal.ingredient
          quantity = ingredient_meal.quantity
          shopping_list[ingredient.name] += quantity
        end
      end
    end
    shopping_list
  end
end
