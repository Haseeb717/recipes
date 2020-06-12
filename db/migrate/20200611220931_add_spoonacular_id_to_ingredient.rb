class AddSpoonacularIdToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :spoonacular_id, :string
  end
end
