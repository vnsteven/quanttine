class QuantitiesController < ApplicationController
  def index
    @quantities = Quantity.where(school_id: current_admin.school.id)
  end
end
