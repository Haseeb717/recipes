class CreateRecipieIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipie_ingredients do |t|
      t.references :recipie, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.float :amount
      t.string :unit

      t.timestamps
    end
  end
end
