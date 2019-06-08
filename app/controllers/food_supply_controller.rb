class FoodSupplyController < ApplicationController
  def new
    @food_supply = FoodSupply.new
    @quantity = Quantity.new
  end

  def create
    @food_supply = FoodSupply.create!(name: params[:food_name])
    @quantity = Quantity.create!(quantity: params[:quantity], school_id: current_admin.school_id, food_supply_id: @food_supply.id)
    if @quantity.save
      redirect_to new_admin_food_supply_path(current_admin)
    else
      render "new"
    end
  end
end
