FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { "password" }
    school { FactoryBot.create(:school) }
  end
end