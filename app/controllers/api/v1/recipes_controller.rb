class Api::V1::RecipesController < Api::V1::BaseController

	def index
		recipes = Recipe.all
		render :json=>{recipe: recipes}
	end

	def show
		recipe = Recipe.includes(:ingredients).find_by_id(params[:id])
		
		recipe_hash = recipe.as_json
		recipe_hash['stars'] = 5
    recipe_hash['steps'] = 5
    recipe_hash['ingredients'] = 10
    recipe_hash['cost'] = 10
    recipe_hash['leftover_score'] = 23
    recipe_hash['health_score'] = 43
		render :json=>{recipe: recipe_hash}
	end	

	def five_minutes_recipes
		recipes = Recipe.where(:readyInMinutes => 5)

		recipes_hash = recipes.as_json
		recipes_hash.each_with_index do |item,index|
      item['stars'] = 5
      item['steps'] = 5
      item['ingredients'] = 10
      item['cost'] = 10
      item['leftover_score'] = 23
      item['health_score'] = 43
    end
		render :json=>{recipe: recipes_hash}
	end

	def max_15_min_recipe
		recipes = Recipe.joins(:ingredients).group('recipes.id').having('COUNT(ingredients.id) < 5').all
		recipes_hash = recipes.as_json
		recipes_hash.each_with_index do |item,index|
      item['stars'] = 5
      item['steps'] = 5
      item['ingredients'] = 10
      item['cost'] = 10
      item['leftover_score'] = 23
      item['health_score'] = 43
    end
		render :json=>{recipe: recipes_hash}
	end
end