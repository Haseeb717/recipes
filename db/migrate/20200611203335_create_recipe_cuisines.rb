class CreateRecipeCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_cuisines do |t|
      t.references :recipie, foreign_key: true
      t.references :cuisine, foreign_key: true

      t.timestamps
    end
  end
end
