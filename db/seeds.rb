# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting Product, Inventory, Raw Material and logs"
Product.delete_all
Inventory.delete_all
FinalProduct.delete_all
RawMaterial.delete_all
RecordLog.delete_all

puts "Creating final products..."
final_product = FinalProduct.create!(name: "Caixa OPGW")

puts "Creating raw materials..."
raw_material_ferro = RawMaterial.create!(name: "Ferro")
raw_material_aco = RawMaterial.create!(name: "Aço")

puts "Creating products..."
product_opgw_ferro = Product.new(name: "Caixa OPGW ferro", quantity: 2)
product_opgw_ferro.final_product = final_product
product_opgw_ferro.raw_material = raw_material_ferro
product_opgw_ferro.save

product_opgw_aco = Product.new(name: "Caixa OPGW Aço", quantity: 5)
product_opgw_aco.final_product = final_product
product_opgw_aco.raw_material = raw_material_aco
product_opgw_aco.save

puts "Creating inventory"
inventory_ferro = Inventory.new(quantity: 100)
inventory_ferro.raw_material = raw_material_ferro
inventory_ferro.save

inventory_aco = Inventory.new(quantity: 100)
inventory_aco.raw_material = raw_material_aco
inventory_aco.save