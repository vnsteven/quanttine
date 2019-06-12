require 'rails_helper'

RSpec.describe Profile, type: :model do
  before(:each) do
    @school = FactoryBot.create(:school)
    @profile = FactoryBot.create(:profile)
  end

  it "has a valid factory" do
    expect { build(:profile).to be_valid }
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@profile).to be_a(Profile)
    end

  end

  context "associations" do

    describe "#user" do
      it { expect(@profile).to belong_to(:user) }
    end
    
    describe "join_table_profile_preferences" do
      it { expect(@profile).to have_many(:join_table_profile_preferences) }
    end

    describe "#preferences" do
      it { expect(@profile).to have_many(:preferences) }
    end

    describe "user_meals" do
      it { expect(@profile).to have_many(:user_meals) }
    end

  end

end