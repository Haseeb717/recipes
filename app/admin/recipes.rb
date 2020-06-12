ActiveAdmin.register Recipe do

  permit_params :title, :readyInMinutes, :sourceUrl, :image, :summary, :vegetarian, :healthScore, :pricePerServing, :instructions
  
end
