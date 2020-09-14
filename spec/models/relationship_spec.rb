require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    2.times { FactroyBot.create(:user) }
  end

  it "has a valid factory" do
    FactroyBot.create(:relationship)
    expect { FactroyBot.create(:relationship) }.to change(Relationship.all, :count).by(1)
  end

  describe "Presence of follower_id, followed_id" do
    it "is valid with a follower_id and followed_id" do
      relationship = Relationship.new(follower_id: User.first.id, followed_id: User.second.id)
      expect(relationship).to be_valid
    end

    it "is invalid without a follower_id" do
      relationship = Relationship.new(follower_id: nil, followed_id: User.first.id)
      relationship.valid?
      expect(relationship.errors[:follower_id]).to include("can't be blank")
    end

    it "is invalid without a followed_id" do
      relationship = Relationship.new(follower_id: User.first.id, followed_id: nil)
      relationship.valid?
      expect(relationship.errors[:followed_id]).to include("can't be blank")
    end
  end

  it "can not follow yourself" do
    relationship = Relationship.new(follower_id: User.first.id, followed_id: User.first.id)
    relationship.valid?
    expect(relationship.errors[:followed_id]).to include("自分自身をフォローすることはできません")
  end

end
