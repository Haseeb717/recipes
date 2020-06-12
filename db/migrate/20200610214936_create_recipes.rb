class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :readyInMinutes
      t.string :sourceUrl
      t.string :image
      t.text :summary
      t.boolean :vegetarian
      t.float :healthScore
      t.float :pricePerServing
      t.text :instructions

      t.timestamps
    end
  end
end
