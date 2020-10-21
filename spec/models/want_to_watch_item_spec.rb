require 'rails_helper'

RSpec.describe WantToWatchItem, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:want_to_watch_item) }.to change(WantToWatchItem.all, :count).by(1)
  end

  describe 'presence of user_id, item_id' do
    it 'is valid with a user_id and item_id' do
      want_to_watch_item = WantToWatchItem.new(user_id: user.id, item_id: item.id)
      expect(want_to_watch_item).to be_valid
    end

    it 'is invalid without a user_id' do
      want_to_watch_item = WantToWatchItem.new(user_id: nil, item_id: item.id)
    want_to_watch_item.valid?
    expect(want_to_watch_item.errors[:user_id]).to include("を入力してください")
    end

    it 'is invalid without a item_id' do
      want_to_watch_item = WantToWatchItem.new(user_id: user.id, item_id: nil)
      want_to_watch_item.valid?
      expect(want_to_watch_item.errors[:item_id]).to include("を入力してください")
    end
  end

  describe "観たい！機能" do
    it "作品へのが観たい！が作成できること" do
      expect{ FactoryBot.create(:want_to_watch_item) }.to change{ WantToWatchItem.all.count }.by(1)
    end

    it "作品への観たい！が削除できること" do
      FactoryBot.create(:want_to_watch_item)
      expect{ WantToWatchItem.first.destroy }.to change { WantToWatchItem.all.count }.by(-1)
    end

    it "同じユーザーが同じ作品に2回以上観たい！を作成できないこと" do
      WantToWatchItem.create(user_id: user.id, item_id: item.id)
      want_to_watch_item = WantToWatchItem.new(user_id: user.id, item_id: item.id)
      want_to_watch_item.valid?
      expect(want_to_watch_item.errors[:item_id]).to include("はすでに存在します")
    end
  end

end
