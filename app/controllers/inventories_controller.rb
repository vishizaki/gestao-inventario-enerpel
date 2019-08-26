class InventoriesController < ApplicationController
  before_action :find_inventory, only: [:edit, :update]

  def edit
  end

  def update
    if @inventory.update!(inventory_params)
      previous_quantity = @inventory.quantity_before_last_save
      RecordLog.create!(title: "Alteração da quantidade de #{@inventory.raw_material.name} - #{previous_quantity} para #{@inventory.quantity} unidades", date: Time.now.strftime("%d/%m/%Y %H:%M"))
      redirect_to root_path 
    end
  end

  private

  def find_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:quantity)
  end
end
