require 'rails_helper'

RSpec.describe School, type: :model do
  before(:each) do
    @school = FactoryBot.create(:school)
  end

  it "has a valid factory" do
    expect(build(:school)).to be_valid
  end

  context "validations" do

    it "is valid with valid attribute" do
      expect(@school).to be_a(School)
    end

    describe "#city" do
      it { expect(@school).to validate_presence_of(:city) }
      it { expect(@school).to validate_length_of(:city).is_at_least(2) }
    end

    describe "#street address" do
      it { expect(@school).to validate_presence_of(:street_address) }
      it { expect(@school).to validate_length_of(:street_address).is_at_least(2) }

    end

    describe "#name" do
      it { expect(@school).to validate_presence_of(:name) }
      it { expect(@school).to validate_length_of(:name).is_at_least(2) }
    end

    describe "#zipcode" do
      it { expect(@school).to validate_presence_of(:zipcode) }
      it { expect(@school).to validate_length_of(:zipcode).is_at_least(2) }
    end

  end

  context "associations" do

    describe "#admins" do
      it { expect(@school).to have_many(:admins) }
    end

    describe "#profiles" do
      it { expect(@school).to have_many(:profiles) }
    end

    describe "#quantities" do
      it { expect(@school).to have_many(:quantities) }
    end

    describe "#food_supplies" do
      it { expect(@school).to have_many(:food_supplies) }
    end

    describe "#school_meals" do
      it { expect(@school).to have_many(:school_meals) }
    end

    describe "#daily_services" do
      it { expect(@school).to have_many(:daily_services) }
    end

  end

end