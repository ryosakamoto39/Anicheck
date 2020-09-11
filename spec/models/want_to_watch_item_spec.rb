require 'rails_helper'

RSpec.describe WantToWatchItem, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }

  it "has a valid factory" do
    expect { FactoryBot.create(:want_to_watch_item) }.to change(WantToWatchItem.all, :count).by(1)
  end


end
