ActiveAdmin.register RecipieIngredient do

  permit_params :recipie_id, :ingredient_id, :amount, :unit
  
end
