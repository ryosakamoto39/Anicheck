FactoryBot.define do
  factory :message do
    association :user
    association :room
    sequence(:content) { 'こんにちは！' }
  end
end
