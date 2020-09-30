FactoryBot.define do
  factory :user, aliases: %i[follower from] do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'Password12' }
  end
end
