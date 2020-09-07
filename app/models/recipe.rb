class Recipe < ApplicationRecord
	has_many :ingredients, :through => :recipe_ingredients  # Edit :needs to be plural same as the has_many relationship   
  has_many :recipe_ingredients

  has_many :meals, :through => :recipe_meals  # Edit :needs to be plural same as the has_many relationship   
  has_many :recipe_meals

  has_many :cuisines, :through => :recipe_cuisines  # Edit :needs to be plural same as the has_many relationship   
  has_many :recipe_cuisines
end
