require "rails_helper"

RSpec.feature "WatchedItems", type: :feature do
  scenario "作品に対して、ボタンをクリックして「観た！」を作成し、各ページの観た！数が変化すること。また、削除ができること", js: true do

    #レビューの事前作成
    FactoryBot.create(:item)

    #一般ユーザーでログインページへ
    user = FactoryBot.create(:user)
    sign_in user

    #作品に観た！を追加
    expect do
      visit "/items/#{Item.first.id}"
      click_link "観た！"
      sleep(1)
    end.to change(Item.first.watched_items, :count).by(1)

    #観た！が1になる
    visit "/"
    expect(page).to have_content("観た！1")

    #検索一覧の作品ページの観たが1になる
    visit "/search"
    expect(page).to have_content("観た！1")

    #ユーザーページの観た実績が1になり、表示される作品についても実績が1となる
    visit "/users/#{user.id}"
    click_link "観た！(1)"
    expect(page).to have_content("観た！1", count: 1)

    #作品で観た取り消し
    expect do
      visit "/items/#{Item.first.id}"
      click_link "観た！1"
      sleep(1)
    end.to change(Item.first.watched_items, :count).by(-1)

    #観た！が0になる
    visit "/"
    expect(page).not_to have_content("観た！")

    #検索一覧の作品ページの観たが0になる
    visit "/search"
    expect(page).to have_content("観た！")

#    #ユーザーページの観た実績が0になり、表示される作品についても実績が0となる
#    visit "/users/#{user.id}"
#    click_link "観た！(0)"
#    expect(page).to have_content("観た！(0)", count: 0)
  end
end
