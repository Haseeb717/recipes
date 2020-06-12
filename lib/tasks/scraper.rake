require 'open-uri'
require 'json'

task :potdrive_scraper => :environment do
  
  quote_chars = %w(" | ~ ^ & *)

  begin
    @report = CSV.read("#{Rails.root}/ingredient.csv", headers: :first_row, quote_char: quote_chars.shift)
  rescue CSV::MalformedCSVError
    quote_chars.empty? ? raise : retry 
  end

  @report.each do |report|
    data = report.to_s.split(",")
    
    reusable = data[0]
    name = data[1]
    name_title = name.split(";")
    spoon_id = name_title[1]
    name = name_title[0]

    quantity_1 = data[2]
    unit_1 = data[3]
    price_1 = data[4]

    quantity_2 = data[5]
    unit_2 = data[6]
    price_2 = data[7]

    quantity_3 = data[8]
    unit_3 = data[9]
    price_3 = data[10]

    quantity_4 = data[11]
    unit_4 = data[12]
    price_4 = data[13]


    ingredient =  Ingredient.create(:name=>name,:reusable=>reusable,:spoonacular_id=>spoon_id)

    if quantity_1.present?
      Quantity.create(:ingredient_id=>ingredient.id,:amount=>quantity_1,:price=>price_1,:unit=>unit_1)
    end

    if quantity_2.present?
      Quantity.create(:ingredient_id=>ingredient.id,:amount=>quantity_2,:price=>price_1,:unit=>unit_2)
    end

    if quantity_3.present?
      Quantity.create(:ingredient_id=>ingredient.id,:amount=>quantity_3,:price=>price_1,:unit=>unit_3)
    end

    if quantity_4.present?
      Quantity.create(:ingredient_id=>ingredient.id,:amount=>quantity_4,:price=>price_1,:unit=>unit_4)
    end
    
  end
  
end

task :guid_json => :environment do
  Ingredient.all.each do |ingredient|
    url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient.name}&apiKey=a01f7f87b7c64b6a930332c9fb7654d4"
    response = HTTParty.get(url)
    response.each do |recipe|
      Recipe.create(:title=>recipe.title, :sourceUrl=>recipe.sourceUrl, :image=>recipe.image,:spoonacular_id=>recipe.id)
    end
  end
end
  
