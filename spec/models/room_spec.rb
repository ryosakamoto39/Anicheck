require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { FactoryBot.create(:room) }

  it "有効なファクトリーを持つこと" do
    FactoryBot.create(:room)
    expect { FactoryBot.create(:room) }.to change { Room.all.count }.by(1)
  end

  describe "削除の依存関係" do
    it "roomを削除すると、紐付くentryも全て削除されること" do
      2.times { FactoryBot.create(:user) }
      Entry.create(room_id: room.id, user_id: User.first.id)
      Entry.create(room_id: room.id, user_id: User.second.id)
      expect { room.destroy }.to change { Entry.all.count }.by(-2)
    end
  end

    it "roomを削除すると、紐付くmessageも全て削除されること" do
      2.times { FactoryBot.create(:user) }
      Message.create(room_id: room.id, user_id: User.first.id, content: "test")
      Message.create(room_id: room.id, user_id: User.second.id, content: "test")
      expect { room.destroy }.to change { Message.all.count}.by(-2)
    end

end
