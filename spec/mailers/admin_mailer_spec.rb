require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  before(:each) do
    @school = FactoryBot.create(:school)
    @admin = FactoryBot.create(:admin)
  end

  it "has a valid factory" do
    expect(build(:admin)).to be_valid
  end

  context "public instance methods" do

    describe "#welcome_mail" do

      it "should not be nil" do
        expect(AdminMailer.welcome_email(@admin).deliver_now).not_to be_nil
      end

    end

  end
end