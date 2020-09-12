class Api::V1::HomeController < Api::V1::BaseController
	def cuisines
		cuisines = Cuisine.all
		render :json=>{cuisines: cuisines}
	end

	def meal_types
		meal_types = MealType.all
		render :json=>{meal_types: meal_types}
	end


end