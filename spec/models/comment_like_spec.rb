require 'rails_helper'

RSpec.describe CommentLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }

  it '有効なファクトリーを持つこと' do
    expect { FactoryBot.create(:comment_like) }.to change(CommentLike.all, :count).by(1)
  end

  describe 'user_idとcomment_idが存在すること' do
    it 'is valid with a user_id and comment_id' do
      comment_like = CommentLike.new(user_id: user.id, comment_id: comment.id)
      expect(comment_like).to be_valid
    end

    it 'user_idが入力されていること' do
      comment_like = CommentLike.new(user_id: nil, comment_id: comment.id)
      comment_like.valid?
      expect(comment_like.errors[:user_id]).to include("を入力してください")
    end

    it 'comment_idが入力されていること' do
      comment_like = CommentLike.new(user_id: user.id, comment_id: nil)
      comment_like.valid?
      expect(comment_like.errors[:comment_id]).to include("を入力してください")
    end
  end

  it "作成と削除ができること" do
    expect { FactoryBot.create(:comment_like) }.to change(CommentLike.all, :count).by(1)
    expect { CommentLike.first.destroy }.to change(CommentLike.all, :count).by(-1)
  end

end
