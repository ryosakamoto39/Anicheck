require 'rails_helper'

RSpec.describe WatchedItem, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:watched_item) }.to change(WatchedItem.all, :count).by(1)
  end

  describe 'presence of user_id, item_id' do
    it 'is valid with a user_id and item_id' do
      watched_item = WatchedItem.new(user_id: user.id, item_id: item.id)
      expect(watched_item).to be_valid
    end

    it 'is invalid without a user_id' do
      watched_item = WatchedItem.new(user_id: nil, item_id: item.id)
      watched_item.valid?
      expect(watched_item.errors[:user_id]).to include("を入力してください")
    end

    it 'is invalid without a item_id' do
      watched_item = WatchedItem.new(user_id: user.id, item_id: nil)
      watched_item.valid?
      expect(watched_item.errors[:item_id]).to include("を入力してください")
    end
  end

  describe "観た！機能" do
    it "作品への観た！が作成できること" do
      expect{ FactoryBot.create(:watched_item) }.to change { WatchedItem.all.count}.by(1)
    end

    it "作品への観た！が削除できること" do
      FactoryBot.create(:watched_item)
      expect { WatchedItem.first.destroy }.to change { WatchedItem.all.count }.by(-1)
    end

    it "同じユーザーが同じ作品に2回以上観た！を作成できないこと" do
      WatchedItem.create(user_id: user.id, item_id: item.id)
      watched_item = WatchedItem.new(user_id: user.id, item_id: item.id)
      watched_item.valid?
      expect(watched_item.errors[:item_id]).to include("はすでに存在します")
    end
  end

end
