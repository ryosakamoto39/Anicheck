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
      sleep (1)
    end.to change(Item.first.watched_items, :count).by(1)

    #観た！が1になる
    visit "/"
    expect(page).to have("観た！1")






  end
end
