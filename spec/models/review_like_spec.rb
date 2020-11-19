require 'rails_helper'

RSpec.describe ReviewLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review) }

  it '有効なファクトリーを持つこと' do
    expect { FactoryBot.create(:review_like) }.to change(ReviewLike.all, :count).by(1)
  end

  describe 'user_idとreview_idの存在性' do
    it 'user_idとreview_idが存在すること' do
      review_like = ReviewLike.new(user_id: user.id, review_id: review.id)
      expect(review_like).to be_valid
    end

    it 'user_idがなければ無効であること' do
      review_like = ReviewLike.new(user_id: nil, review_id: review.id)
      review_like.valid?
      expect(review_like.errors[:user_id]).to include("を入力してください")
    end

    it 'review_idがなければ無効であること' do
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
