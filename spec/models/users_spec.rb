require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @school = FactoryBot.create(:school)
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
end