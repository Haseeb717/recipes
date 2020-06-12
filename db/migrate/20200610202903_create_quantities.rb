class CreateQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.references :ingredient, foreign_key: true
      t.integer :amount
      t.float :price
      t.string :unit

      t.timestamps
    end
  end
end
