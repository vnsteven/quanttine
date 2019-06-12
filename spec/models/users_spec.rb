require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @school = FactoryBot.create(:school)
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it { expect(@user).to validate_presence_of(:first_name) }
    end    

    describe "#last_name" do
      it { expect(@user).to validate_presence_of(:last_name) }
    end

    describe "#last_name" do
      it { expect(@user).to validate_length_of(:last_name).is_at_least(2) }
    end

  end

  context "associations" do

    describe "#profiles" do
      it { expect(@user).to have_one(:profile) }
    end

  end

  context "public instance methods" do

    describe "#profiles" do

      it "should not be nil" do
        expect(@user.profile).not_to be_nil
      end
      
    end

  end

end