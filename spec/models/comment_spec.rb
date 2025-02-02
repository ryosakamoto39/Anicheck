require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review) }
  let(:comment) { FactoryBot.create(:comment) }
  let(:comment_like) { FactoryBot.create(:comment_like) }

  #自分で自分のレビューにコメントしているデモデータ
  let(:self_comment) { FactoryBot.create(:comment, review: self_review, user:user) }
  let(:self_review) { FactoryBot.create(:review, user: user) }

  it '有効なファクトリーを持つこと' do
    expect { FactoryBot.create(:comment) }.to change(Comment.all, :count).by(1)
  end

  describe 'user_idとreview_id、contentの存在性' do
    it 'user_idとreview_id、contentが存在すること' do
      comment = Comment.new(user_id: user.id, review_id: review.id, content: 'test')
      expect(comment).to be_valid
    end

    it 'user_idが存在すること' do
      comment = Comment.new(user_id: nil, review_id: review.id, content: 'test')
      comment.valid?
      expect(comment.errors[:user_id]).to include("を入力してください")
    end

    it 'review_idが存在すること' do
      comment = Comment.new(user_id: user.id, review_id: nil, content: 'test')
      comment.valid?
      expect(comment.errors[:review_id]).to include("を入力してください")
    end

    it 'contentが存在すること' do
      comment = Comment.new(user_id: user.id, review_id: review.id, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end
  end

  describe 'commentの文字数について' do
    it 'commentが201文字以上であること' do
      comment.content = 'あ' * 201
      comment.valid?
      expect(comment.errors[:content]).to include('は200文字以内で入力してください')
    end

    it 'commentが200文字以内であること' do
      comment.content = 'あ' * 200
      comment.valid?
      expect(comment).to be_valid
    end
  end

  #削除の依存関係
  it 'コメントの作成・削除ができること' do
    expect { FactoryBot.create(:comment) }.to change { Comment.all.count}.by(1)
    expect { Comment.first.destroy }.to change { Comment.all.count }.by(-1)
  end

end
