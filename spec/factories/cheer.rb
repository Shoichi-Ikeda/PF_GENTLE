FactoryBot.define do
  factory :cheer do
    association :user, factory: :user
    association :wine, factory: :wine
  end
end