class Ingredient < ApplicationRecord
	has_many :recipie_ingredients
	has_many :recipes, :through => :recipie_ingredients  # Edit :needs to be plural same as the has_many relationship   
end
