puts "Deleting Product, Inventory, Raw Material and logs"
Product.delete_all
Inventory.delete_all #deletar depois
FinalProduct.delete_all
RawMaterial.delete_all
RecordLog.delete_all #deletar depois

def create_product(product_hash, final_product)
  
  product_hash.each do |product_name, product_quantity|
    if RawMaterial.find_by(name: product_name)
      material = RawMaterial.find_by(name: product_name)
    else
      material = RawMaterial.create!(name: product_name)
      unless Inventory.find_by(name: product_name)
        inventory = Inventory.new(name: material.name, quantity: 1000)
        inventory.raw_material = material
        inventory.save
      end
    end

    product = Product.new(name: "#{final_product.name} #{product_name}", quantity: product_quantity)
    product.final_product = final_product
    product.raw_material = material
    product.save
  end
end

puts "Creating opgw products..."
final_product_opgw_torre = FinalProduct.create!(name: "Caixa OPGW - Torre")
product_opgw_torre_hash = {"Corpo da Caixa":1,"Tampa da Caixa":1,"Base para Fixação das Bandejas":1,"Bandejas Plasticas":2,"AbraçadeiraNRX14":4,"Protetores de Emenda":24,"Fita Isolante":1,"Lacre para kit entrada OPGW":2,"Parafuso Inox M5x16":8,"Cupilha Inox ":4,"O´Ring da caixa":1,"O´Ring chato":4,"O´Ring redondo":4,"O´Ring do lacre":2,"Parafuso Olhal":6,"Porca de Segurança":2,"Pino":6,"Suporte T":1,"Suporte Interno":2,"Suporte Externo":2,"Parafuso M12x150":2,"Parafuso M12x65":9,"Arruela Lisa M12":19,"Arruela pressão M12":19,"Porca M12":38}
create_product(product_opgw_torre_hash, final_product_opgw_torre)

final_product_opgw_portico = FinalProduct.create!(name: "Caixa OPGW - Pórtico")
product_opgw_portico_hash = {"Corpo da Caixa":1,"Tampa da Caixa":1,"Base para Fixação das Bandejas":1,"Bandejas Plasticas":2,"AbraçadeiraNRX14":4,"Protetores de Emenda":24,"Fita Isolante":1,"Lacre para kit entrada OPGW":2,"Parafuso Inox M5x16":8,"Cupilha Inox ":4,"O´Ring da caixa":1,"O´Ring chato":4,"O´Ring redondo":4,"O´Ring do lacre":2,"Parafuso Olhal":6,"Porca de Segurança":2,"Pino":6,"Suporte T":1,"Suporte para BAP":1,"Parafuso M12x150":2,"Parafuso M12x65":7,"Arruela Lisa M12":17,"Arruela pressão M12":17,"Porca M12":34}
create_product(product_opgw_portico_hash, final_product_opgw_portico)

puts "Creating cruzetas..."
final_product_cruzeta_torre = FinalProduct.create!(name: "Cruzeta com Suporte - Torre")
product_cruzeta_torre_hash = {"Cruzeta":1,"Suporte Interno":2,"Suporte Externo":2,"Parafuso M12x150":2,"Parafuso M12x65":2,"Arruela Lisa M12":6,"Arruela de Pressão M12":6,"Porca M12":14}
create_product(product_cruzeta_torre_hash, final_product_cruzeta_torre)

final_product_cruzeta_portico = FinalProduct.create!(name: "Cruzeta com Suporte - Pórtico")
product_cruzeta_portico_hash = {"Cruzeta":1,"Suporte para BAP":2,"Parafuso M12x150":2,"Arruela Lisa M12":4,"Arruela Pressão M12":4,"Porca M12":10}
create_product(product_cruzeta_portico_hash, final_product_cruzeta_portico)

puts "Creating grampos de torres..."

final_product_grampo_torre_9a11 = FinalProduct.create!(name: "Grampo Guia de Descida em Torre - (9:00 a 11:99)")
product_grampo_torre_9a11_hash = {"Suporte Interno ":1,"Suporte Externo":1,"Grampo Guia de Descida (9:00 a 11:99)":1,"Parafuso M12x150":1,"Parafuso M12x65":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_torre_9a11_hash, final_product_grampo_torre_9a11)

final_product_grampo_torre_12a13 = FinalProduct.create!(name: "Grampo Guia de Descida em Torre - (12:00 a 13:99)")
product_grampo_torre_12a13_hash = {"Suporte Interno ":1,"Suporte Externo":1,"Grampo Guia de Descida (12:00 a 13:99)":1,"Parafuso M12x150":1,"Parafuso M12x65":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_torre_12a13_hash, final_product_grampo_torre_12a13)

final_product_grampo_torre_14a15 = FinalProduct.create!(name: "Grampo Guia de Descida em Torre - (14:00 a 15:99)")
product_grampo_torre_14a15_hash = {"Suporte Interno ":1,"Suporte Externo":1,"Grampo Guia de Descida (14:00 a 15:99)":1,"Parafuso M12x150":1,"Parafuso M12x65":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_torre_14a15_hash, final_product_grampo_torre_14a15)

final_product_grampo_torre_16a17 = FinalProduct.create!(name: "Grampo Guia de Descida em Torre - (16:00 a 17:99)")
product_grampo_torre_16a17_hash = {"Suporte Interno ":1,"Suporte Externo":1,"Grampo Guia de Descida (16:00 a 17:99)":1,"Parafuso M12x150":1,"Parafuso M12x65":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_torre_16a17_hash, final_product_grampo_torre_16a17)

puts "Creating grampos de pórticos..."

final_product_grampo_portico_9a11 = FinalProduct.create!(name: "Grampo Guia de Descida em Pórtico - (9:00 a 11:99)")
product_grampo_portico_9a11_hash = {"Suporte para BAP":1,"Grampo Guia de Descida (9:00 a 11:99)":1,"Parafuso M12x150":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_portico_9a11_hash, final_product_grampo_portico_9a11)

final_product_grampo_portico_12a13 = FinalProduct.create!(name: "Grampo Guia de Descida em Pórtico - (12:00 a 13:99)")
product_grampo_portico_12a13_hash = {"Suporte para BAP":1,"Grampo Guia de Descida (12:00 a 13:99)":1,"Parafuso M12x150":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_portico_12a13_hash, final_product_grampo_portico_12a13)

final_product_grampo_portico_14a15 = FinalProduct.create!(name: "Grampo Guia de Descida em Pórtico - (14:00 a 15:99)")
product_grampo_portico_14a15_hash = {"Suporte para BAP":1,"Grampo Guia de Descida (14:00 a 15:99)":1,"Parafuso M12x150":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_portico_14a15_hash, final_product_grampo_portico_14a15)

final_product_grampo_portico_16a17 = FinalProduct.create!(name: "Grampo Guia de Descida em Pórtico - (16:00 a 17:99)")
product_grampo_portico_16a17_hash = {"Suporte para BAP":1,"Grampo Guia de Descida (16:00 a 17:99)":1,"Parafuso M12x150":1,"Arruela Lisa M12":2,"Arruela Pressão M12":2,"Porca M12":3}
create_product(product_grampo_portico_16a17_hash, final_product_grampo_portico_16a17)
