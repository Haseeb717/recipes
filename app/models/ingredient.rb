class Ingredient < ApplicationRecord
	has_many :recipes, :through => :recipe_ingredients  # Edit :needs to be plural same as the has_many relationship   
  has_many :recipe_ingredients
end
