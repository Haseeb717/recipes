class CreateRecipeMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_meals do |t|
      t.references :recipie, foreign_key: true
      t.references :meal_type, foreign_key: true

      t.timestamps
    end
  end
end
