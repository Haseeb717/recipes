class RecipieIngredient < ApplicationRecord
  belongs_to :recipie
  belongs_to :ingredient
end
