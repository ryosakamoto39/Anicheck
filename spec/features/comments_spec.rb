require "rails_helper"

RSpec.feature "Comments", type: :feature do

  scenario "一般ユーザーがコメント作成できること" do
    review = FactoryBot.create(:review)
    item = Item.find(review.item_id)

    #一般ユーザーでログイン
    user = FactoryBot.create(:user)
    sign_in user

    #作品ページへ
    visit "/items/#{item.id}"

    #コメント作成（キャンセル）
    expect do
      click_link "コメントする"
      fill_in "comment[content]", with: "コメント作成"
      click_button "キャンセル"
      sleep(1)
    end.to change(user.comments, :count).by(0)

    #コメント作成
    expect do
      click_link "コメントする"
      fill_in "comment[content]", with: "コメント作成"
      click_button "決定"
      sleep(1)
    end.to change(user.comments, :count).by(1)
    expect(page).to have_content("コメント作成", count: 1)
  end

end
