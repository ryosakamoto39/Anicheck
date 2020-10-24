require "rails_helper"

RSpec.describe "Items", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }
  let(:item) { FactoryBot.create(:item) }

  describe "#new" do
    context "管理者" do
      it "正常にレスポンスを返すこと" do
        sign_in admin
        get "/items/new"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in admin
        get "/items/new"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#index" do
    context "管理者" do
      it "正常にレスポンスを返すこと" do
        sign_in admin
        get "/items"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in admin
        get "/items"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#show" do
    context "未ログイン" do
      it "正常にレスポンスを返すこと" do
        get "/items/#{item.id}"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        get "/items/#{item.id}"
        expect(response).to have_http_status "200"
      end
    end

    context "一般ユーザー" do
      it "正常にレスポンスを返すこと" do
        sign_in user
        get "/items/#{item.id}"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in user
        get "/items/#{item.id}"
        expect(response).to have_http_status "200"
      end
    end

    context "管理者" do
      it "正常にレスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#edit" do
    context "管理者" do
      it "正常にレスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}/edit"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}/edit"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#edit" do
    context "管理者" do
      it "正常にレスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}/edit"
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}/edit"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#update" do
    context "管理者" do
      it "正常にレスポンスを返すこと" do
        sign_in admin
        get "/items/#{item.id}/edit"
        expect(response).to be_successful
      end

      it "作品の修正ができること" do
        sign_in admin
        item1 = FactoryBot.create(:item)
        item_params = FactoryBot.attributes_for(:item, title: "test", story: "test_story")
        expect do
          patch "/items/#{item1.id}", params: { item: item_params }
        end.to change(Item.all, :count).by(0)
        expect(response).to redirect_to "/items/#{item1.id}"
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "#destroy" do
    context "管理者" do
      it "作品の削除ができること" do
        sign_in admin
        item1 = FactoryBot.create(:item)
        expect do
          delete "/items/#{item1.id}"
        end.to change(Item.all, :count).by(-1)
        expect(response).to redirect_to "/items"
        expect(response).to have_http_status "302"
      end
    end
  end

end
