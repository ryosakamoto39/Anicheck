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
