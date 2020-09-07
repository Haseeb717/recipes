class MealType < ApplicationRecord
	has_many :recipe_meals
	has_many :recipes, :through => :recipe_meals  # Edit :needs to be plural same as the has_many relationship   
end
