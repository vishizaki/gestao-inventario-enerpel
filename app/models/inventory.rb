class Inventory < ApplicationRecord
  belongs_to :raw_material
  validates :quantity, numericality: { greater_than: -1 }


  def update_quantity(quantity)
    self.quantity += quantity
  end

  def sell_inventory(material, quantity)
    material.quantity -= quantity
  end
end
