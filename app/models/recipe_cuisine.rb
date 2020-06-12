class RecipeCuisine < ApplicationRecord
  belongs_to :recipie
  belongs_to :cuisine
end
