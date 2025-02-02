require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    2.times { FactoryBot.create(:user) }
  end

  describe 'follower_idとfollowed_idの有効性' do
    it 'follower_idとfollowed_idが存在すること' do
      relationship = Relationship.new(follower_id: User.first.id, followed_id: User.second.id)
      expect(relationship).to be_valid
    end

    it 'follower_idがなければ無効であること' do
      relationship = Relationship.new(follower_id: nil, followed_id: User.first.id)
      relationship.valid?
      expect(relationship.errors[:follower_id]).to include("を入力してください")
    end

    it 'followed_idがなければ無効であること' do
      relationship = Relationship.new(follower_id: User.first.id, followed_id: nil)
      relationship.valid?
      expect(relationship.errors[:followed_id]).to include("を入力してください")
    end
  end

  it '自分自身をフォローすることができないこと' do
    relationship = Relationship.new(follower_id: User.first.id, followed_id: User.first.id)
    relationship.valid?
    expect(relationship.errors[:followed_id]).to include('自分自身をフォローすることはできません')
  end

  it "同じ人を二度フォローできないこと" do
    Relationship.create(followed_id: User.first.id, follower_id: User.second.id)
    relationship = Relationship.new(followed_id: User.first.id, follower_id: User.second.id)
    relationship.valid?
    expect(relationship.errors[:followed_id]).to include("はすでに存在します")
  end

  it "作成と削除ができること" do
    expect{ FactoryBot.create(:relationship) }.to change { Relationship.all.count}.by(1)
    expect{ Relationship.first.destroy}.to change { Relationship.all.count}.by(-1)
  end

end
