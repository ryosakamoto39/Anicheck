require "rails_helper"

RSpec.describe "Search", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "#search" do
    context "未ログイン" do
      it "正常なレスポンスを返すこと" do
        get "/search"
        expect(response).to be_successful
      end
      it "200レスポンスを返すこと" do
        get "/search"
        expect(response).to have_http_status "200"
      end
    end

    context "一般ユーザー" do
      before do
        sign_in user
      end

      it "正常なレスポンスを返すこと" do
        get "/search"
        expect(response).to be_successful
      end
      it "200レスポンスを返すこと" do
        get "/search"
        expect(response).to have_http_status "200"
      end
    end
  end

end
