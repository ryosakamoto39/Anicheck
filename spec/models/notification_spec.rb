require 'rails_helper'

RSpec.describe Notification, type: :model do
  before do
    2.times { FactoryBot.create(:user) }
  end

  let(:review) { FactoryBot.create(:review) }
  let(:comment) { FactoryBot.create(:comment) }
  let(:message) { FactoryBot.create(:message) }

  it "有効なファクトリーを持つこと" do
    expect { FactoryBot.create(:notification, visitor_id: User.first.id, visited_id: User.second.id) }.to change { Notification.all.count }.by(1)
  end

  describe "存在性の確認" do
    it "visitor_id, visited_id, actionの全てがあれば有効であること" do
      notification = Notification.create(visitor_id: User.first.id, visited_id: User.second.id, action: "")
      expect(notification).to be_valid
    end

    #visitor_idがなければ無効であること
    it { should have_not_null_constraint_on(:visitor_id) }

    #visited_idがなければ無効であること
    it { should have_not_null_constraint_on(:visited_id) }

    #actionがなければ無効であること
    it { should have_not_null_constraint_on(:action) }
  end

    it "acitionにcommentが設定できる" do
      notification = Notification.create(visitor_id: User.first.id, visited_id: User.second.id, action: "comment")
      expect(notification).to be_valid
    end

    it "acitionにreview_likeが設定できる" do
      notification = Notification.create(visitor_id: User.first.id, visited_id: User.second.id, action: "review_like")
      expect(notification).to be_valid
    end

    it "actionにfollowが設定できる" do
      notification = Notification.create(visitor_id: User.first.id, visited_id: User.second.id, action: "follow")
      expect(notification).to be_valid
    end

    it "acitionにdmが設定できる" do
      notification = Notification.create(visitor_id: User.first.id, visited_id: User.second.id, action: "dm")
      expect(notification).to be_valid
    end
    
end
