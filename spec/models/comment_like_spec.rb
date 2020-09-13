require 'rails_helper'

RSpec.describe CommentLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }

  it "has a valid factory" do
    expect { FactoryBot.create(:comment_like) }.to change(CommentLike.all, :count).by(1)
  end

end
