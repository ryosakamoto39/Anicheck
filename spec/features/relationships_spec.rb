require "rails_helper"

RSpec.feature "Relationships", type: :feature do
  scenario "ユーザーをフォローすることができ、各ページのフォロー数が変化すること。また、フォロー解除ができること", js: true do

    #事前処理
    user = FactoryBot.create(:user)
    other_user = FactoryBot.create(:user)

    #userでログイン
    sign_in user

    #userのプロフィールに移動
    visit "/users/#{user.id}"
    expect(page).to have_content("フォロー(0)", count: 1)
    expect(page).to have_content("フォロワー(0)", count: 1)

    #other_userのユーザー画面へ遷移
    visit "/users/#{other_user.id}"

    #フォローリンクを押下
    expect do
      click_link "フォロー"
      sleep(1)
    end.to change(user.following, :count).by(1)

    #フォロー数が1に変化していること
    visit "/users/#{user.id}"
    click_link "フォロー(1)"
    expect(page).to have_content(other_user.name, count: 1)
    expect(page).to have_content("フォロワー(1)", count: 1) #other_userのフォロワー
    expect(page).to have_content("フォロー(0)", count: 1) #other_userのフォロー

    #再度、other_userのユーザー画面へ遷移
    visit "/users/#{other_user.id}"

    #other_userのフォロワーが１になる
    click_link "フォロワー(1)"
    expect(page).to have_content(user.name, count: 2) #headerで1個
    expect(page).to have_content("フォロー(1)", count: 1) #userのフォロワー
    expect(page).to have_content("フォロワー(1)", count: 1)

    #被フォロー状態
    other_user.follow(user)

    #ユーザー検索結果
    visit "/search?type=user"
    expect(page).to have_content("フォロー(1)", count: 2) #other_user
    expect(page).to have_content("フォロワー(1)", count: 2) #other_user

    #アンフォローを実行
    expect do
      visit "/users/#{other_user.id}"
      click_link "フォロー解除"
      sleep(1)
    end.to change(user.following, :count).by(-1)
  end

end
