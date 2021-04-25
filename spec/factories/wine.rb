FactoryBot.define do
  factory :wine do
    association :user, factory: :user
    wine_name { Faker::Lorem.characters(number:10) }
  end
end