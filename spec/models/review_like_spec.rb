require 'rails_helper'

RSpec.describe ReviewLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:review_like) }.to change(ReviewLike.all, :count).by(1)
  end

  describe 'presence of user_id, review_id' do
    it 'is valid with a user_id and review_id' do
      review_like = ReviewLike.new(user_id: user.id, review_id: review.id)
      expect(review_like).to be_valid
    end

    it 'is invalid without a user_id' do
      review_like = ReviewLike.new(user_id: nil, review_id: review.id)
      review_like.valid?
      expect(review_like.errors[:user_id]).to include("を入力してください")
    end

    it 'is inavlid without a review_id' do
      review_like = ReviewLike.new(user_id: user.id, review_id: nil)
      review_like.valid?
      expect(review_like.errors[:review_id]).to include("を入力してください")
    end
  end

  it "2つ以上のいいねを付けられないこと" do
    ReviewLike.create(user_id: user.id, review_id: review.id)
    reviewlike = ReviewLike.new(user_id: user.id, review_id: review.id)
    reviewlike.valid?
    expect(reviewlike.errors[:review_id]).to include("はすでに存在します")
  end

  it "作成と削除ができること" do
    expect { FactoryBot.create(:review_like) }.to change { ReviewLike.all.count }.by(1)
    expect { ReviewLike.first.destroy }.to change { ReviewLike.all.count }.by(-1)
  end

end
