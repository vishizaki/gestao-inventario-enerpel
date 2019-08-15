class InventoriesController < ApplicationController
  before_action :find_inventory, only: [:edit, :update]

  def edit
  end

  def update
    redirect_to root_path if @inventory.update!(inventory_params)
  end

  private

  def find_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:quantity)
  end
end
