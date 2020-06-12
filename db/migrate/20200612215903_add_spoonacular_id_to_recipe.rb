class AddSpoonacularIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :spoonacular_id, :string
  end
end
