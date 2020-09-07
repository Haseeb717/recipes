class Api::V1::HomeController < Api::V1::BaseController
	def cuisine
		cuisines = Cuisine.all
		render :json=>{cuisines: cuisines.to_json}
	end

	def meal_type
		meal_types = MealType.all
		render :json=>{meal_types: meal_types.to_json}
	end


end