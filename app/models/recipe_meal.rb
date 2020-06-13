class RecipeMeal < ApplicationRecord
  belongs_to :recipe
  belongs_to :meal_type
end
