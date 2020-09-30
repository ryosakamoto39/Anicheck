FactoryBot.define do
  factory :review do
    score { 4 }
    sequence(:content) { |n| "#{n}：観始めるとやめられなくなります！" }
    association :user
    association :item

    trait :with_tags do
      tag_list { '楽しい, 続きが気になる, 男の子向き' }
    end
  end
end
