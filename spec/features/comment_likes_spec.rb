require 'rails_helper'

#RSpec.feature "CommentLikes", type: :feature do

#  scenario "コメントに対して、ボタンをクリックして「いいね！」を作成し、各ページのいいね！数が変化すること。また、削除ができること", js: true do
#    #レビューの事前作成
#    FactoryBot.create(:comment)

#    #一般ユーザーでログインページへ
#    user = FactoryBot.create(:user)
#    sign_in user

#    #コメントにいいね!
#    expect do
#      visit "/items/#{Item.first.id}"
#      find(".commentlike-area").click
#      sleep(1)
#    end.to change(CommentLike.first.comment_likes, :count).by(1)

#    #コメントでいいね取り消し
#    expect do
#      find(".commentlike-area").click
#      sleep(1)
#    end.to change(Comment.first.comment_likes, :count).by(-1)
#  end

#end
