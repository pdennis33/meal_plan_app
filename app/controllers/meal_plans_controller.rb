class MealPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal_plan, only: [:show, :edit, :update, :destroy]

  def index
    @meal_plans = current_user.meal_plans
    respond_to do |format|
      format.html
      format.json { render json: @meal_plans.to_json(only: [:id, :date], include: { meals: { only: :name } }) }
    end
  end

  def show
  end

  def new
    @meal_plan = MealPlan.new
  end

  def create
    @meal_plan = current_user.meal_plans.build(meal_plan_params)
    if @meal_plan.save
      redirect_to @meal_plan, notice: 'Meal plan was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal_plan.update(meal_plan_params)
      redirect_to @meal_plan, notice: 'Meal plan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @meal_plan.destroy
    redirect_to meal_plans_url, notice: 'Meal plan was successfully destroyed.'
  end

  private

  def set_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:date, meal_ids: [])
  end
end
