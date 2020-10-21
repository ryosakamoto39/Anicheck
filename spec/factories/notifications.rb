FactoryBot.define do
  factory :notification do
    association :review
    association :comment
    association :message
  end
end
