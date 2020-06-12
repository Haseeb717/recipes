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
  file = File.read 'public/guid.json'
  json = JSON.parse file
  json["assets"].each do |asset|
    blog = Blog.find_by_video_url(asset["external_id"])
    puts asset["external_id"]
    if blog.present?
      puts "Blog:"+blog.id.to_s
      blog.update_attributes(:guid=>asset["id"])
    end
  end
end
  
