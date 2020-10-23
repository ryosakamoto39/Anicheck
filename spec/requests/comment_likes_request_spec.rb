require "rails_helper"

RSpec.describe "CommentLikes", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "#create" do
    before do
      @comment = FactoryBot.create(:comment)
    end

    context "一般ユーザー" do
      it "正常にレスポンスを返すこと" do
        sign_in user
        post "/comment_likes?comment_id=#{@comment.id}", xhr: true
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end
  end

end
