class CreateIngredientsMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients_meals do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
