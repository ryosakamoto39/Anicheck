require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room) }

    it "有効なファクトリーを持つこと" do
      expect { FactoryBot.create(:entry) }.to change(Entry.all, :count).by(1)
    end

    describe "user_id, room_idの存在" do
      it "user_id, room_idの両方があれば有効な状態であること" do
        entry = Entry.new(user_id: user.id, room_id: room.id)
        expect(entry).to be_valid
      end

      it "user_idが空であれば無効であること" do
        entry = Entry.new(user_id: nil, room_id: room.id)
        expect(entry).not_to be_valid
      end

      it "room_idが空であれば無効であること" do
        entry = Entry.new(user_id: user.id, room_id: nil)
        expect(entry).not_to be_valid
      end
    end

    #作成と削除ができること
    it "作成と削除ができること" do
      expect { FactoryBot.create(:entry) }.to change {Entry.all.count }.by(1)
      expect { Entry.first.destroy }.to change{ Entry.all.count }.by(-1)
    end

end
