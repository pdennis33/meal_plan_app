class IngredientsMeal < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal
  validates :quantity, presence: true
end
