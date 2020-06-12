ActiveAdmin.register Quantity do

  permit_params :ingredient_id, :amount, :price, :unit
  
end
