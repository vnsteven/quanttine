# require "rails_helper"

# RSpec.describe "the signup process", type: :feature do
#   before :each do
#     @school = FactoryBot.create(:school)
#     @user = User.create(first_name: "steven", last_name: "nguyen", email: "steven@email.com", password: "password")
#   end

#   it "signs me in" do
#     click_button ".btn btn-primary btn-lg mr-2 mb-2 banner-button"
    
#     within(".modal-content") do
#       fill_in 'Email', with: @user.email
#       fill_in 'Password', with: @user.password
#     end

#     click_button "S'inscrire"

#     expect(page).to have_content 'Success'
#   end
# end
