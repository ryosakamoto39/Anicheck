require "rails_helper"

RSpec.feature "WantToWatchItems", type: :feature do
  scenario "作品に対して、ボタンをクリックして「観たい！」を作成し、各ページの観た！数が変化すること。また、削除ができること", js: true do

    #レビューの事前作成
    FactoryBot.create(:item)

    #一般ユーザーでログインページへ
    user = FactoryBot.create(:user)
    sign_in user

    #作品に観たい！を追加
    expect do
      visit "/items/#{Item.first.id}"
      click_link "観たい！"
      sleep(1)
    end.to change(Item.first.want_to_watch_items, :count).by(1)

    #観たい！が1になる
    visit "/"
    expect(page).to have_content("観たい！1")

    #検索一覧の作品ページの観たいが1になる
    visit "/search"
    expect(page).to have_content("観たい！1")

    #ユーザーページの観たい実績が1になり、表示される作品についても実績が1となる
    visit "/users/#{user.id}"
    click_link "観たい！(1)"
    expect(page).to have_content("観たい！1", count: 1)

    #作品で観たい取り消し
    expect do
      visit "/items/#{Item.first.id}"
      click_link "観たい！1"
      sleep(1)
    end.to change(Item.first.want_to_watch_items, :count).by(-1)

    #観たい！が0になる
    visit "/"
    expect(page).not_to have_content("観たい！")

    #検索一覧の作品ページの観たいが0になる
    visit "/search"
    expect(page).to have_content("観たい！")

    #ユーザーページの観たい実績が0になり、表示される作品についても実績が0となる
    visit "/users/#{user.id}"
    click_link "観たい！(0)"
    expect(page).to have_content("観たい！", count: 1)
  end
end
