require 'rails_helper'

RSpec.describe Serving, type: :model do
  before(:each) do
    @serving = FactoryBot.create(:serving)
  end

  it "has valid factory" do
    expect(build(:serving)).to be_valid
  end

  context "associations" do

    describe "#school_meal" do
      it { expect(@serving).to belong_to(:school_meal) }
    end

    describe "#food_supply" do
      it { expect(@serving).to belong_to(:food_supply) } 
    end

    describe "#preparing_user_meals" do
      it { expect(@serving).to have_many(:preparing_user_meals).dependent(:destroy) }
    end

    describe "#user_meals" do
      it { expect(@serving).to have_many(:user_meals) }
    end

  end
end