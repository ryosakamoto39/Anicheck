require "rails_helper"

RSpec.describe "Reviews", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }
  let(:item) { FactoryBot.create(:item) }
  let(:review) { FactoryBot.create(:review) }

  describe "#new" do
    context "一般ユーザー" do
      before do
        sign_in user
      end

      it "正常なレスポンスを返すこと" do
        get "/reviews/new?item_id=#{item.id}"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        get "/reviews/new?item_id=#{item.id}"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#create" do
    context "一般ユーザー" do
      before do
        sign_in user
      end

      it "レビューが追加できること" do
        review_params = FactoryBot.attributes_for(:review, user_id: user.id, item_id: item.id)

        expect do
          post "/reviews", params: { review: review_params }
        end.to change(user.reviews, :count).by(1)

        expect(response).to redirect_to "/items/#{item.id}?review_id=#{user.reviews.first.id}"
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "#destroy" do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @review = FactoryBot.create(:review, user: @user)
    end

    context "一般ユーザー" do
      before do
        sign_in user
      end

      it "レビューが削除できること" do
        expect do
          delete "/reviews/#{@review.id}"
        end.to change(@user.reviews, :count).by(-1)

        expect(response).to redirect_to "/items/#{@review.item.id}"
        expect(response).to have_http_status "302"
      end
    end

    context "管理者" do
      before do
        sign_in admin
      end

      it "destroys a review" do
        expect do
          delete "/reviews/#{@review.id}"
        end.to change(@user.reviews, :count).by(-1)

        expect(response).to redirect_to "/items/#{@review.item.id}"
        expect(response).to have_http_status "302"
      end
    end
  end

end
