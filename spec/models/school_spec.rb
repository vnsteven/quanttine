require 'rails_helper'

RSpec.describe School, type: :model do
  before(:each) do
    @school = FactoryBot.create(:school)
  end

  it "has a valid factory" do
    expect(build(:school)).to be_valid
  end
end