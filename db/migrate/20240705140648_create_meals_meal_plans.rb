class CreateMealsMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :meals_meal_plans do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :meal_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
