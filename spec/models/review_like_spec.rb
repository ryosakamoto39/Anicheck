require 'rails_helper'

RSpec.describe ReviewLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review) }

  it "has a valid factory" do
    expect { FactoryBot.create(:review_like) }.to change(ReviewLike.all, :count).by(1)
  end

  describe "presence of user_id, review_id" do
    it "is valid with a user_id and review_id" do
      review_like = ReviewLike.new(user_id: user.id, review_id: review.id)
      expect(review_like).to be_valid
    end



  end



end
