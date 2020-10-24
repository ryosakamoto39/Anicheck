require "rails_helper"

RSpec.describe "WatchedItems", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "#create" do
    before do
      @item = FactoryBot.create(:item)
    end

#    context "未ログインの場合" do
#      it "正常にレスポンスを返すこと" do
#        post "/comment_likes?comment_id=#{@comment.id}", xhr: true
#        expect(response).to redirect_to "/users/sign_in"
#      end
#    end

    context "一般ユーザー" do
      before do
        sign_in user
      end

      it "正常にレスポンスを返すこと" do
        post "/watched_items?item_id=#{@item.id}", xhr: true
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        post "/watched_items?item_id=#{@item.id}", xhr: true
        expect(response).to have_http_status "200"
      end
    end
  end

end
