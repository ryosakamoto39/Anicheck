#require "rails_helper"

#RSpec.describe "Messages", type: :request do
#  let(:user) { FactoryBot.create(:user) }
#  let(:other) { FactoryBot.create(:other) }
#  let(:room)  { FactoryBot.create(:room) }

#  describe "#create" do
#    context "一般ユーザー" do
#      before do
#        sign_in user
#      end

#      it "正常にレスポンスを返すこと" do
#        FactoryBot.create(:room)
#        FactoryBot.create(:entry, room_id: room.id, user_id: other.id)
#        post "/messages"
#        expect(response).to be_successful
#      end

#      it "200レスポンスを返すこと" do
#        FactoryBot.create(:entry)
#        post "/messages"
#        expect(response).to have_http_status "200"
#      end
#    end
#  end

#end
