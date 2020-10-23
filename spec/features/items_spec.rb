require "rails_helper"

RSpec.feature "Items", type: :feature do
  scenario "管理者は新しい商品を作成する", js: true do
    #管理者でログインページへ
    admin = FactoryBot.create(:admin)
    sign_in admin

    #作品投稿画面へ
    visit "/items/new"

    expect do
      #項目入力
      fill_in "item[title]", with: "test title"
      fill_in "item[story]", with: "test story"
      click_button "登録する"
    end.to change(Item.all, :count).by(1)

    click_link "ログアウト"
    expect(page).to have_text("ログアウトしました")
  end
end
