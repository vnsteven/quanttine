require "rails_helper"

RSpec.describe ServingsController, type: :controller do

  describe "GET #index" do 
    it "assigns to @servings" do
      @school_meals = SchoolMeal.create
      get :index
    end
  end

  describe "GET #new" do 

  end

  describe "POST #create" do 

  end

  describe "DELETE #destroy" do 

  end

end