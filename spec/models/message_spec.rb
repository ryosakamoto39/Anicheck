require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { FactoryBot.create(:user)}
  let(:room) { FactoryBot.create(:room)}
  let(:message) { FactoryBot.create(:message)}

  it "有効なファクトリーを持つこと" do
    expect { FactoryBot.create(:message) }.to change { Message.all.count }.by(1)
  end

  describe "user_id, room_id, contentの存在" do
    it "user_id, room_id, contentの全てがあれば有効であること" do
      message = Message.new(user_id: user.id, room_id: room.id, content: "test")
      expect(message).to be_valid
    end

    it "user_idがなければ無効であること" do
      message = Message.new(user_id: nil, room_id: room.id, content: "test")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end

    it "room_idがなければ無効であること" do
      message = Message.new(user_id: user.id, room_id: nil, content: "test")
      message.valid?
      expect(message.errors[:room_id]).to include("を入力してください")
    end

    it "contentがなければ無効であること" do
      message = Message.new(user_id: user.id, room_id: room.id, content: nil)
      message.valid?
      expect(message.errors[:content]).to include("を入力してください")
    end
  end

  describe "メッセージの長さ" do
    it "メッセージの長さが200文字以下であること" do
      FactoryBot.create(:message, content: "a" * 200)
      expect(message).to be_valid
    end

    it "メッセージの長さが201文字以上であること" do
      message.content = "a" * 201
      message.valid?
      expect(message.errors[:content]).to include("は200文字以内で入力してください")
    end
  end

end
