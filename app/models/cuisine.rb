class Cuisine < ApplicationRecord
	has_many :recipes, :through => :recipe_cuisines  # Edit :needs to be plural same as the has_many relationship   
  has_many :recipe_cuisines
end
