class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :find_material, only: [:add_quantity, :subtract_quantity]


  def home
    @inventories = Inventory.all.sort_by { |material| material.raw_material.name }
  end

  def add_quantity
    @inventory_material.update_quantity(1)
    if @inventory_material.save
      RecordLog.create(title: "Compra de 1 quantidade de #{@inventory_material.raw_material.name}", date: Time.now.strftime("%d/%m/%Y %H:%M"))
      redirect_to root_path
    end
  end

  def subtract_quantity
    @inventory_material.update_quantity(-1)
    if @inventory_material.save
      RecordLog.create(title: "Venda de 1 quantidade de #{@inventory_material.raw_material.name}", date: Time.now.strftime("%d/%m/%Y %H:%M"))
      redirect_to root_path
    else
      flash[:alert] = "Você não pode baixar o material #{@inventory_material.raw_material.name} pois não há estoque suficiente"
      redirect_to root_path
    end
  end

  def sell_opgw_box
    materials_array = FinalProduct.first.products

    materials_array.each do |material|
      inventory_materials = material.raw_material.inventories
      
      inventory_materials.each do |inventory_material|
        inventory_material.sell_inventory(inventory_material, inventory_material.quantity)
        raise

        if inventory_material.save
          RecordLog.create(title: "Venda de 1 quantidade de #{materials_array.name}", date: Time.now.strftime("%d/%m/%Y %H:%M"))
        else
          flash[:alert] = "Você não pode baixar a caixa OPGW pois não há estoque suficiente"
          redirect_to root_path
        end
      end
    end
    redirect_to root_path
  end

  private

  def find_material
    @inventory_material = Inventory.find(params[:material])
  end
end
