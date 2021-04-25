FactoryBot.define do
  factory :post_comment do
    association :user, factory: :user
    association :wine, factory: :wine
  end
end