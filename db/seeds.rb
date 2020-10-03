User.create!(name: '管理者',
             email: 'admin@gmail.com',
             password: '11111111',
             password_confirmation: '11111111',
             admin: true)

User.create!(name: 'テストユーザー',
             email: 'user00@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '合田美桜',
             email: 'user01@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '市原由奈',
             email: 'user02@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '天野のぞみ',
             email: 'user03@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '綾音',
             email: 'user04@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '藤原千花',
             email: 'user05@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'あおい',
             email: 'user06@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'もなか',
             email: 'user07@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'エリカ',
             email: 'user08@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'サヤ',
             email: 'user09@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '神尾アキラ',
             email: 'user10@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '綾時ハヤテ',
             email: 'user11@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '東条秀明',
             email: 'user12@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'りょうま',
             email: 'user13@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '走一郎',
             email: 'user14@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'ジン',
             email: 'user15@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '泉鏡花',
             email: 'user16@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '水原光太',
             email: 'user17@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'あゆむ',
             email: 'user18@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: 'スバル',
             email: 'user19@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '葵ゆうた',
             email: 'user20@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
Review.create!(
  user_id: ,
  item_id: ,
  content: '',
  score: ,
  tag_list: %w[],
)

# *70ほど


Review.all.sample(Review.count).each_with_index do |review, i|
  time = Time.zone.now - (12 * i).hours
  review.update_attribute(:created_at, time)
end

#User.where.each do |user|
#  Review.where.sample(15).each do |review|
#    ReviewLike.create!(user_id: user.id, review_id: review.id)
#  end
#end
