class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  # before_action :authorize_admin
  # before_action :authenticate_user!

  before_action :find_material, only: [:add_quantity, :subtract_quantity]

  def home
    @inventories = Inventory.all.sort_by { |material| material.raw_material.name }
    @inventory = Inventory.new
  end

  # def add_quantity
  #   @inventory_material.update_quantity(1)
  #   if @inventory_material.save
  #     RecordLog.create(title: "Compra de 1 quantidade de #{@inventory_material.raw_material.name}", date: Time.now.strftime("%d/%m/%Y %H:%M"))
  #     redirect_to root_path
  #   end
  # end

  # def subtract_quantity
  #   @inventory_material.update_quantity(-1)
  #   if @inventory_material.save
  #     RecordLog.create(title: "Venda de 1 quantidade de #{@inventory_material.raw_material.name}", date: Time.now.strftime("%d/%m/%Y %H:%M"))
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "Você não pode baixar o material #{@inventory_material.raw_material.name} pois não há estoque suficiente"
  #     redirect_to root_path
  #   end
  # end

  def sell_product
    quantity_multiplier = params[:quantity].to_i
    final_product = FinalProduct.find_by_name(params[:product_to_sell])
    materials_array = final_product.products  
    product_bm_hash = get_final_product_bm_hash(materials_array, quantity_multiplier)
    inventory_quantity_hash = get_inventory_quantity_hash(materials_array)
    record_log = RecordLog.new(title: "Venda de #{quantity_multiplier} quantidade(s) de #{final_product.name}", date: Time.now.strftime("%d/%m/%Y %H:%M"))

    materials_array.each do |product|
      product.raw_material.inventories.each do |inventory_material|
        record_final_product_sale(inventory_material, product_bm_hash, inventory_quantity_hash, final_product, record_log)
      end
    end
    redirect_to root_path
  end

  private

  def find_material
    @inventory_material = Inventory.find(params[:material])
  end

  def get_final_product_bm_hash(final_product_array, quantity_multiplier)
    product_bm_hash = {}
    final_product_array.each do |material|
      product_bm_hash[material.raw_material.name] = material.quantity * quantity_multiplier
    end

    return product_bm_hash
  end

  def get_inventory_quantity_hash(final_product_array)
    inventory_hash = {}
    final_product_array.each do |material|
      inventories_material = material.raw_material.inventories
      inventories_material.each do |inventory_material|
        inventory_hash[inventory_material.raw_material.name] = inventory_material.quantity
      end
    end

    return inventory_hash
  end

  def validate_quantity(bm_hash, inventory_hash)
    results_array = []
    results_array_inv = []
    results_array_bm = []
    bm_hash.each { |key, value| 
      results_array << (inventory_hash[key] >= value)
      results_array_inv << inventory_hash[key]
      results_array_bm << value
    }
    return results_array.include? false
  end

  def record_final_product_sale(inventory_material, product_bm_hash, inventory_quantity_hash, product_name, record_log)
    if validate_quantity(product_bm_hash, inventory_quantity_hash) == false
      inventory_material.sell_inventory(inventory_material, product_bm_hash[inventory_material.raw_material.name])
      inventory_material.save
      record_log.save
    else
      flash[:alert] = "Você não pode baixar o material #{product_name.name} pois não há estoque suficiente"
    end
  end
end
