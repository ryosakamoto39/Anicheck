FactoryBot.define do
  factory :watched_item do
    association :user
    association :item
  end
end
