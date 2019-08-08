class Product < ApplicationRecord
  belongs_to :final_product
  belongs_to :raw_material
end
