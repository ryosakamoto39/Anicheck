require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }
  let(:comment) { FactoryBot.create(:comment, user: user) }
  let(:room1) { FactoryBot.create(:room1) }
  let(:room2) { FactoryBot.create(:room2) }

  it "有効なファクトリーを持つこと" do
    expect { FactoryBot.create(:user) }.to change(User.all, :count).by(1)
  end

  describe "存在性のチェック" do
    it "nameがなければ無効であること" do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがなければ無効であること" do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがなければ無効であること" do
      user.password = nil
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end

  it "重複した名前なら無効であること" do
    user.save
    duplicate_user = FactoryBot.build(:user, name: user.name)
    duplicate_user.valid?
    expect(duplicate_user.errors[:name]).to include("はすでに存在します")
  end

  it "重複したemailなら無効であること" do
    user.save
    duplicate_user = FactoryBot.build(:user, email: user.email)
    duplicate_user.valid?
    expect(duplicate_user.errors[:email]).to include("はすでに存在します")
  end

  it "emailが全て小文字で登録されること" do
    user.email = "TEST@GMAIL.COM"
    user.save
    expect(user.email).to eq "test@gmail.com"
  end

  describe "emailは規定の正規表現に従うこと" do
    it "ドメインのないemailは無効なこと" do
      user.email = "TEST"
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "ドメインのあるemailは有効なこと" do
      user.email = "test@gmail.com"
      expect(user).to be_valid
    end
  end

  describe "passwordの正規表現" do
    it "passwordが6文字以上であれば有効であること" do
      user.password = "a" * 6
      expect(user).to be_valid
    end

    it "passwordが5文字以下では無効であること" do
      user.password = "a" * 5
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  describe "nameの長さ" do
    it "nameの長さが20文字以下であれば有効であること" do
      user.name = "a" * 20
      expect(user).to be_valid
    end

    it "nameの長さが20文字を超えると無効であること" do
      user.name = "a" * 21
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end
  end

  describe "emailの長さ" do
    it "emailの長さが○○文字以下であれば有効であること" do
    user.email = "a" * 245 + "@gmail.com"
    expect(user).to be_valid
    end

    it "emailの長さが○○文字を超えると無効であること" do
    user.email = "a" * 246 + "@gmail.com"
    user.valid?
    expect(user.errors[:email]).to include("は255文字以内で入力してください")
    end
  end

  describe "画像のアップロード" do
    it "画像なしでも有効であること" do
      user.image = nil
      expect(user).to be_valid
    end

#    it "画像のサイズが5MB以下であればアップロードできること" do
#      image_path = Rails.root.join("public/default/5mb.png")
#      user.image = File.open(image_path)
#      user.save
#      expect(user).to be_valid
#    end

#    it "画像のサイズが5MBを超えるとアップロードできないこと" do
#      image_path = Rails.root.join("public/default/over_5mb.png")
#      user.image = File.open(image_path)
#      user.valid?
#      expect(user.errors[:image]).to include("")
#    end
  end

  describe "削除の依存関係" do
    it "削除すると、紐付くフォローが全て削除されること" do
      user.follow(user1)
      user.follow(user2)
      expect{user.destroy}.to change { user.following.all.count }.by(-2)
    end


  end

end
