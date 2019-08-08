class RawMaterial < ApplicationRecord
  has_many :inventories
  has_many :products
end
