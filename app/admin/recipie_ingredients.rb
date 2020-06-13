ActiveAdmin.register RecipieIngredient do

  permit_params :recipe_id, :ingredient_id, :amount, :unit
  
end
