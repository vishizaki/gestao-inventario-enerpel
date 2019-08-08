class CreateFinalProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :final_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
