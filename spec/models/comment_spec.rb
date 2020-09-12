require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review) }
  let(:comment) { FactoryBot.create(:comment) }

  it "has a valid factory" do
    expect { FactoryBot.create(:comment) }.to change(Comment.all, :count).by(1)
  end

  
end
