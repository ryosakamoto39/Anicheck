require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review) }
  let(:comment) { FactoryBot.create(:comment) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:comment) }.to change(Comment.all, :count).by(1)
  end

  describe 'presence of user_id, review_id, content' do
    it 'is valid with a user_id and review_id, content' do
      comment = Comment.new(user_id: user.id, review_id: review.id, content: 'test')
      expect(comment).to be_valid
    end

    it 'is invalid without a user_id' do
      comment = Comment.new(user_id: nil, review_id: review.id, content: 'test')
      comment.valid?
      expect(comment.errors[:user_id]).to include("can't be blank")
    end

    it 'is inavlid without a review_id' do
      comment = Comment.new(user_id: user.id, review_id: nil, content: 'test')
      comment.valid?
      expect(comment.errors[:review_id]).to include("can't be blank")
    end

    it 'is inavlid without a content' do
      comment = Comment.new(user_id: user.id, review_id: review.id, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("can't be blank")
    end
  end

  describe 'length of comment' do
    it 'is invalid with a comment which has over 201 characters' do
      comment.content = 'あ' * 201
      comment.valid?
      expect(comment.errors[:content]).to include('is too long (maximum is 200 characters)')
    end

    it 'is valid with a comment which has 200 characters' do
      comment.content = 'あ' * 200
      comment.valid?
      expect(comment).to be_valid
    end
  end
end
