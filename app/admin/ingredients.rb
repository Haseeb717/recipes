ActiveAdmin.register Ingredient do

  permit_params :name, :reusable, :spoonacular_id
  
end
