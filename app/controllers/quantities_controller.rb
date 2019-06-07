class QuantitiesController < ApplicationController
  def index
    @quantities = Quantity.all
  end
end
