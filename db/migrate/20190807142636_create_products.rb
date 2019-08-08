class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.references :final_product, foreign_key: true
      t.references :raw_material, foreign_key: true

      t.timestamps
    end
  end
end
