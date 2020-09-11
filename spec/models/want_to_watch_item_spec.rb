require 'rails_helper'

RSpec.describe WantToWatchItem, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }

  it "has a valid factory" do
    expect { FactoryBot.create(:want_to_watch_item) }.to change(WantToWatchItem.all, :count).by(1)
  end

  describe "presence of user_id, item_id" do
    it "is valid with a user_id and item_id" do
      want_to_watch_item = WantToWatchItem.new(user_id: user.id, item_id: item.id)
      expect(want_to_watch_item).to be_valid
    end
  end

    it "is invalid without a user_id" do
      want_to_watch_item = WantToWatchItem.new(user_id: nil, item_id: item.id)
      want_to_watch_item.valid?
      expect(want_to_watch_item.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a item_id" do
      want_to_watch_item = WantToWatchItem.new(user_id: user.id, item_id: nil)
      want_to_watch_item.valid?
      expect(want_to_watch_item.errors[:item_id]).to include("can't be blank")
    end

end
