class Api::V1::RecipesController < Api::V1::BaseController

	def index
		recipes = Recipe.all
		render :json=>{recipe: recipes}
	end

	def show
		recipe = Recipe.includes(:ingredients).find_by_id(params[:id])
		render :json=>{recipe: recipe}
	end	

	def five_minutes_recipes
		recipes = Recipe.where(:readyInMinutes => 5)
		render :json=>{recipe: recipes}
	end

	def max_15_min_recipe
		recipes = Recipe.joins(:ingredients).group('recipes.id').having('COUNT(ingredients.id) < 5').all
		render :json=>{recipe: recipes}
	end
end