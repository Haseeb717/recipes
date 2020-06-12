class CreatePantries < ActiveRecord::Migration[5.2]
  def change
    create_table :pantries do |t|
      t.references :user, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
