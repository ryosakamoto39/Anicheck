FactoryBot.define do
  factory :want_to_watch_item do
    association :user
    association :item
        
  end
end
