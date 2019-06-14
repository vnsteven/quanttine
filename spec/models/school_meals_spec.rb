require 'rails_helper'

RSpec.describe SchoolMeal, type: :model do 
  before(:each) do
    @school = FactoryBot.create(:school)
    @school_meal = FactoryBot.create(:school_meal)
  end

  it "has a valid factory" do
    expect(build(:school_meal)).to be_valid 
  end

  context "validations" do

    it "is valid with valid attribute" do
      expect(@school_meal).to be_a(SchoolMeal)
    end

  end

  context "associations" do

    describe "#school" do
      it { expect(@school_meal).to belong_to(:school) }
    end

    describe "#serving" do
      it { expect(@school_meal).to have_many(:servings).dependent(:destroy) }
    end

    describe "#food_supply" do
      it { expect(@school_meal).to have_many(:food_supplies) }
    end

  end
  
end