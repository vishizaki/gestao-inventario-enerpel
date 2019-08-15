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
final_product_opgw = FinalProduct.create!(name: "Caixa OPGW")

puts "Creating raw materials, products and inventory..."
raw_material_list = ["AbraçadeiraNRX14","Arruela de Pressão M12","Arruela Lisa M12","Arruela Pressão M12","Bandejas Plasticas","Base para Fixação das Bandejas","Corpo da Caixa","Cruzeta","Cupilha Inox ","Fita Isolante","Grampo Guia de Descida (12:00 a 13:99)","Grampo Guia de Descida (14:00 a 15:99)","Grampo Guia de Descida (16:00 a 17:99)","Grampo Guia de Descida (9:00 a 11:99)","Lacre para kit entrada OPGW","O´Ring chato","O´Ring da caixa","O´Ring do lacre","O´Ring redondo","Parafuso Inox M5x16","Parafuso M12x150","Parafuso M12x65","Parafuso Olhal","Pino","Porca de Segurança","Porca M12","Protetores de Emenda","Suporte Externo","Suporte Interno","Suporte para BAP","Suporte T","Tampa da Caixa"]
product_opgw_hash = {"Corpo da Caixa":1,"Tampa da Caixa":1,"Base para Fixação das Bandejas":1,"Bandejas Plasticas":2,"AbraçadeiraNRX14":4,"Protetores de Emenda":24,"Fita Isolante":1,"Lacre para kit entrada OPGW":2,"Parafuso Inox M5x16":8,"Cupilha Inox ":4,"O´Ring da caixa":1,"O´Ring chato":4,"O´Ring redondo":4,"O´Ring do lacre":2,"Parafuso Olhal":6,"Porca de Segurança":2,"Pino":6,"Suporte T":1,"Suporte Interno":2,"Suporte Externo":2,"Parafuso M12x150":2,"Parafuso M12x65":9,"Arruela Lisa M12":19,"Arruela pressão M12":19,"Porca M12":38}

product_opgw_hash.each do |product_name, product_quantity|
  material = RawMaterial.create!(name: product_name)  
  product = Product.new(name: "Caixa OPGW #{product_name}", quantity: product_quantity)
  product.final_product = final_product_opgw
  product.raw_material = material
  product.save
  
  # puts "Creating inventory"
  inventory_ferro = Inventory.new(quantity: 100)
  inventory_ferro.raw_material = material
  inventory_ferro.save
end



