require 'rails_helper'

RSpec.describe Preference, type: :model do
  before(:each) do
    @preference = FactoryBot.create(:preference)
  end

  it "has a valid factory" do
    expect{ build(:preference).to be_valid }
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@preference).to be_a(Preference)
    end

    describe "#name" do
      it { expect(@preference).to validate_presence_of(:name) }
      it { expect(@preference).to validate_length_of(:name).is_at_least(2) }
    end

    describe "#category" do
      it { expect(@preference).to define_enum_for(:category) }
    end

  end

end