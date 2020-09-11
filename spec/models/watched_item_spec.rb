require 'rails_helper'

RSpec.describe WatchedItem, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }

  it "has a valid factory" do
    expect { FactoryBot.create(:watched_item) }.to change(WatchedItem.all, :count).by(1)
  end

end
