class RecipeMeal < ApplicationRecord
  belongs_to :recipie
  belongs_to :meal_type
end
