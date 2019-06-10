class QuantitiesController < ApplicationController
  def index
    @quantities = Quantity.all.order("quantity")
  end
end
