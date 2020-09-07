class Recipe < ApplicationRecord
	has_many :recipie_ingredients
	has_many :ingredients, :through => :recipie_ingredients  # Edit :needs to be plural same as the has_many relationship   

	has_many :recipe_meals
  has_many :meals, :through => :recipe_meals  # Edit :needs to be plural same as the has_many relationship   

  has_many :recipe_cuisines
  has_many :cuisines, :through => :recipe_cuisines  # Edit :needs to be plural same as the has_many relationship   
end
