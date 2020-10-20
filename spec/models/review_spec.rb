require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  let(:review) { FactoryBot.create(:review) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:review) }.to change(Review.all, :count).by(1)
  end

  describe "存在性のチェック" do
    before do
      @valid_review = Review.new(user_id: user.id, item_id: item.id, content: "test", score: 5)
    end

    it "user_id, item_id, content, scoreの全てが存在すれば有効であること" do
      expect(@valid_review).to be_valid
    end

    it "user_idが存在しなければ無効であること" do
      @valid_review.user_id = nil
      @valid_review.valid?
      expect(@valid_review.errors[:user_id]).to include("を入力してください")
    end

    it "item_idが存在しなければ無効であること" do
      @valid_review.item_id = nil
      @valid_review.valid?
      expect(@valid_review.errors[:item_id]).to include("を入力してください")
    end

    it "contentが存在しなければ無効であること" do
      @valid_review.content = nil
      @valid_review.valid?
      expect(@valid_review.errors[:content]).to include("を入力してください")
    end

    it "scoreが存在しなければ無効であること" do
      @valid_review.score = nil
      @valid_review.valid?
      expect(@valid_review.errors[:score]).to include("を入力してください")
    end
  end

  describe "内容の長さ" do
    it "内容が1000文字以内であること" do
      review = FactoryBot.create(:review, content: "a" * 1000 )
      expect(review).to be_valid
    end

    it "内容が1001文字以上であること" do
      review.content = "a" * 1001
      review.valid?
      expect(review.errors[:content]).to include("は1000文字以内で入力してください")
    end
  end

  describe "スコアの上限確認" do
    it "スコアの点数が5点以下であること" do
      (1..5).each do |i|
        review.score = i
        expect(review).to be_valid
      end
    end

    it "スコアの点数が5点を超えると無効であること" do
      review = FactoryBot.build(:review, score: 5.01)
      review.valid?
      expect(review.errors[:score]).to include("は5以下の値にしてください")
    end
  end

  it "タグ付けができること" do
    tag_list = Array.new(3) { |n|  "#{n+ 1 }個目のタグ" }
    expect { review.update(tag_list: tag_list) }.to change(ActsAsTaggableOn::Tag, :count).by(3)
  end

  describe "削除の依存関係" do
    it "作成と削除ができること" do
      expect { FactoryBot.create(:review) }.to change { Review.all.count }.by(1)
      expect { Review.first.destroy }.to change { Review.all.count }.by(-1)
    end

    it "削除すると紐付くコメントが全て削除されること" do
      2.times { FactoryBot.create(:comment, review: review) }
      expect { review.destroy }.to change { Comment.all.count }.by(-2)
    end

    it "削除すると紐付くレビューへのいいねが全て削除されること" do
      2.times { FactoryBot.create(:review_like, review: review) }
      expect { review.destroy }.to change { ReviewLike.all.count }.by(-2)
    end
  end

end
