require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  let(:review) { FactoryBot.create(:review) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:review) }.to change(Review.all, :count).by(1)
  end
end
