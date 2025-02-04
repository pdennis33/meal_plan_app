class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to @meal, notice: 'Meal was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_url, notice: 'Meal was successfully destroyed.'
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, ingredient_ids: [], ingredients_meals_attributes: [:id, :ingredient_id, :quantity, :_destroy])
  end
end
