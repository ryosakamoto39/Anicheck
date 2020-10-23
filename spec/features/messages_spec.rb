require "rails_helper"

RSpec.feature "Messages", type: :feature do
  scenario "トークルームに入り、メッセージが送れること。また、相手ユーザーがメッセージを確認できること" do

    #事前処理
    user = FactoryBot.create(:user)
    other_user = FactoryBot.create(:user)

    #userでログイン
    sign_in user

    #other_userのユーザー画面へ遷移
    visit "/users/#{other_user.id}"

    #メッセージボタンを押下
    click_on "メッセージ"

    #メッセージを入力
    fill_in "メッセージを入力して下さい", with: "test message"

    #投稿ボタンを押下
    click_button "投稿"

    #メッセージが画面に表示されていることを確認
    expect(page).to have_content "test message"

    #ログアウトする
    click_link "ログアウト"
    expect(page).to have_text("ログアウトしました")

    #otherユーザーでログイン
    sign_in other_user

    #userのユーザー画面へ遷移
    visit "/users/#{user.id}"

    #メッセージボタンを押下
    click_on "メッセージ"

    #メッセージが画面に表示されていることを確認
    expect(page).to have_content "test message"

    #ログアウトする
    click_link "ログアウト"
    expect(page).to have_text("ログアウトしました")
  end

end
