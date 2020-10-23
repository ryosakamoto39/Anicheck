require "rails_helper"

RSpec.feature "ReviewLikes", type: :feature do
  scenario "レビューに対して、リンクをクリックして「いいね！」を作成し、各ページのいいね！数が変化すること。また、削除ができること", js: true do

    #作品と、紐付くレビューを事前作成
      item = FactoryBot.create(:item)
      FactoryBot.create(:review, item: item)

    #一般ユーザーでログイン
      user = FactoryBot.create(:user)
      sign_in user

    #作品画面に遷移する
      visit "/items/#{item.id}"

    #レビューにいいねを押すと、いいねの数が1つ増えること
      expect do
        click_link "いいね！"
        sleep(1)
      end.to change(Review.first.review_likes, :count).by(1)

    #最近のレビューのいいねが1になる
      visit "/"
      expect(page).to have_content("いいね！1", count: 1)

    #検索画面の作品欄にいいねが1つ増えること
      visit "/search?type=items"
      expect(page).to have_content("いいね！1", count: 1)

    #ユーザーページのいいね実績が1になり、表示されるレビューのいいねも1になる
      visit "/users/#{user.id}"
      click_link "いいね！(1)"
      expect(page).to have_content("いいね！(1)", count: 1)

    #ユーザーページのレビュー実績のいいねが1になる

    #作品画面に遷移する
      visit "/items/#{item.id}"

    #レビューのいいねを押すと、いいねの数が1つ減ること
      expect do
        click_link "いいね！1"
        sleep(1)
      end.to change(Review.first.review_likes, :count).by(-1)

    #最近のレビューのいいねが0になる
      visit "/"
      expect(page).to have_content("いいね！", count: 1)

    #検索結果の作品欄のいいねが0になる
      visit "/search?type=items"
      expect(page).to have_content("いいね！", count: 1)

    #ユーザーページのいいね実績が0になり、表示されるレビューのいいねも0になる
      visit "/users/#{user.id}"
      click_link "いいね！"
      expect(page).to have_content("いいね！", count: 1)

    #ユーザーページのレビュー実績のいいねが0になる
  end

end
