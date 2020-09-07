class Api::V1::RecipesController < Api::V1::BaseController

	def index
		recipes = Recipe.all
		render :json=>{recipe: recipes.to_json}
	end

	def show
		recipes = Recipe.find_by_id(params[:id])
		render :json=>{recipe: recipe}
	end	

	def five_minutes_recipes
		recipes = Recipe.where('readyInMinutes <=?',5)
		render :json=>{recipe: recipes.to_json}
	end

	def max_15_min_recipe
		recipes = Recipe.where('readyInMinutes <=?',5)
		render :json=>{recipe: recipes.to_json}
	end
end