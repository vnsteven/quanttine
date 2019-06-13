FactoryBot.define do
  factory :profile do
    user { FactoryBot.create(:user) }
    school { FactoryBot.create(:school) }
  end
end
