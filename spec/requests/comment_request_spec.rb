require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "#create" do
#    before do
#      @review = FactoryBot.create(:review, item: item)
#    end

    context "一般ユーザー" do
      it "正常にレスポンスを返すこと" do
        sign_in user
        get "/comments/new", xhr: true
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in user
        get "/comments/new", xhr: true
        expect(response).to have_http_status "200"
      end
    end
  end

end
