require "rails_helper"

RSpec.describe "Home", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }

  describe "#TOP" do
    context "未ログイン状態" do
      it "正常にレスポンスを返すこと" do
        get "/"
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

    context "一般ユーザー" do
      it "正常にレスポンスを返すこと" do
      sign_in user
      get "/"
      expect(response).to be_successful
      expect(response).to have_http_status "200"
      end
    end

    context "管理者" do
      it "正常にレスポンスを返すこと" do
      sign_in admin
      get "/"
      expect(response).to be_successful
      expect(response).to have_http_status "200"
      end
    end
  end
  
end
