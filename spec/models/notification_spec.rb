require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    2.times { FactoryBot.create(:user) }
  end

  let(:review) { FactoryBot.create(:review) }
  let(:comment) { FactoryBot.create(:comment) }
  let(:message) { FactoryBot.create(:message) }

  it "有効なファクトリーを持つこと" do
    expect { FactoryBot.create(:message) }.to change { Message.all.count }.by(1)
  end

  xit "visitor_idが必要" do

  end


#visitor_idがなければ無効であること
#visited_idがなければ無効であること
#アクションがなければ無効であること
#既読するとチェックの値が１になること
#review_idが設定できる
#comment_idが設定できる
#message_idが設定できる
#review_like_idが設定できる


end
