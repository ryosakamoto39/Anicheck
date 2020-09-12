FactoryBot.define do
  factory :comment do
    association :user
    association :review
    sequence(:content) { |n| "これは#{n}個目のコメントです。" }    
  end
end
