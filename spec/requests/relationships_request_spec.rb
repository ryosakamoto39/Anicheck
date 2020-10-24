#require 'rails_helper'

#RSpec.describe "Relationships", type: :request do
#  let(:user) { FactoryBot.create(:user) }
#  let(:other) { FactoryBot.create(:other) }

#  describe "#create" do
#    before do
#      sign_in user
#    end

#    context "一般ユーザー" do
#      it "正常にレスポンスを返すこと" do
#        post "/relationships?user_id=#{other.id}"
#        expect(request).to be_successful
#      end

#      it "200レスポンスを返すこと" do
#        post "/relationships?user_id=#{other.id}"
#        expect(request).to have_http_status "200"
#      end
#    end
#  end

#  describe "#destroy" do
#    before do
#      sign_in user
#    end

#    context "一般ユーザー" do
#      it "正常にレスポンスを返すこと" do
#        post "/relationships?user_id=#{other.id}"
#        expect(request).to be_successful
#      end

#      it "200レスポンスを返すこと" do
#        delete "/relationships/#{other.id}"
#        expect(request).to have_http_status "200"
#      end
#    end
#  end

#end
