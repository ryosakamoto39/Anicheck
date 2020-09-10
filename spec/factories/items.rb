FactoryBot.define do
  factory :item do
    sequence(:title) {  |n| "作品：#{n}" }
    story { "未来から来たロボットが未来を変えるために現代で活躍する" }
        
  end
end
