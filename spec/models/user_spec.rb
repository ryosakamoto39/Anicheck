require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "has a valid factory" do
    expect { FactoryBot.create(:user) }.to change(User.all, :count).by(1)
  end



end
