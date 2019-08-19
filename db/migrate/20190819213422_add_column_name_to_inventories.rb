class AddColumnNameToInventories < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :name, :string
  end
end
