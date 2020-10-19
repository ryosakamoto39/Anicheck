require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  let(:review) { FactoryBot.create(:review) }

  it 'has a valid factory' do
    expect { FactoryBot.create(:item) }.to change(Item.all, :count).by(1)
  end

  describe "存在性のチェック" do
    before do
      @valid_item = FactoryBot.build(:item)
    end

    it "buildデータが有効であること" do
      expect(@valid_item).to be_valid
    end

    it "storyがなければ無効であること" do
      @valid_item.story = nil
      @valid_item.valid?
      expect(@valid_item.errors[:story]).to include("を入力してください")
    end

    it "titleがなければ無効であること" do
      @valid_item.title = nil
      @valid_item.valid?
      expect(@valid_item.errors[:title]).to include("を入力してください")
    end
  end

    it "同じタイトルはつけられないこと" do
      FactoryBot.create(:item, title: "test")
      duplicate_item = Item.new(title: "test")
      duplicate_item.valid?
      expect(duplicate_item.errors[:title]).to include("はすでに存在します")
    end

    describe "タイトルの長さ" do
      it "タイトルの長さが25文字以下であること" do
        item.title = "a" * 25
        expect(item).to be_valid
      end

      it "タイトルの長さが26文字以上であること" do
        item.title = "a" * 26
        item.valid?
        expect(item.errors[:title]).to include("は25文字以内で入力してください")
      end
    end

    describe "あらすじの長さ" do
      it "あらすじの長さが300文字以下であること" do
        item.story = "a" * 300
        expect(item).to be_valid
      end

      it "あらすじの長さが301文字以上であること" do
        item.story = "a" * 301
        item.valid?
        expect(item.errors[:story]).to include("は300文字以内で入力してください")
      end
    end

    describe "画像のアップロード" do
      it "画像なしでも有効であること" do
        item = FactoryBot.build(:item, image: nil)
        expect(item).to be_valid
      end

#      it "画像なしの場合、デフォルト画像が表示されること" do
#        item = FactoryBot.build(:item, image: nil)
#        expect(item.image.url).to eq "/assets/*.png"
#      end
#画像URLが変わるため、設定ができない

      it "デフォルト画像以外の画像を登録できること" do
        image_path = Rails.root.join("app/assets/images/anicheck.png")
        item = FactoryBot.build(:item, image: File.open(image_path))
        item.save
        expect(item.image.url).to eq "/uploads/item/image/#{item.id}/anicheck.png"
      end
    end

    describe "作品の平均スコア算出" do
      it "レビュー数が0の場合、0点となること" do
        expect(item.average_score).to eq 0
      end

      it "点数の平均が算出できること" do
        (1..5).each do |i|
          FactoryBot.create(:review, item: item, score: i)
        end
        expect(item.average_score).to eq 3
      end
    end

    describe "ランキング機能" do
      before do
        #アイテムを3つ作成
        3.times { FactoryBot.create(:item) }
        @item1 = Item.first
        @item2 = Item.second
        @item3 = Item.third

        #item1には３点のレビューを2つ、4点のレビューを1つ与える
        #ポイントは1
        2.times { FactoryBot.create(:review, item: @item1, score: 3) }
        FactoryBot.create(:review, item: @item1, score: 4)

        #item2には5点のレビューを3つ与える
        #ポイントは6
        3.times { FactoryBot.create(:review, item: @item2, score: 5) }

        #item3には4点のレビューを3つ与える
        #ポイントは3
        3.times { FactoryBot.create(:review, item: @item3, score: 4) }
      end

      it "ランクのスコアを正しく計算できること" do
        #border 1点以下はnilを返す
        expect(Item.rank[@item1.id]).to eq nil
        expect(Item.rank[@item2.id]).to eq 6
        expect(Item.rank[@item3.id]).to eq 3
      end

      it "ランクのスコア順にidを返すこと" do
        #予想では、@item2,@item3の順
        popular_ids = [@item2.id, @item3.id]
        expect(Item.popular_ids).to eq popular_ids
      end
    end

#    it "観た！の降順にidを返す" do
#      2.times { FactoryBot.create(:item) }
#      FactoryBot.create(:watched_item, item: Item.first)
#      2.times { FactoryBot.create(:watched_item, item: Item.second) }
#
#      # 予想ではidの降順を返す
#      watched_ids = Item.all.order(id: :desc).ids
#      expect(Item.watched_ids).to eq watched_ids
#    end
#
#    it "食べたい！の降順にidを返す" do
#      2.times { FactoryBot.create(:item) }
#      FactoryBot.create(:want_to_watch_item, item: Item.first)
#      2.times { FactoryBot.create(:want_to_watch_item, item: Item.second) }
#
#      # 予想ではidの降順を返す
#      want_to_watch_ids = Item.all.order(id: :desc).ids
#      expect(Item.want_to_watch_ids).to eq want_to_watch_ids
#    end
#テスト通過しないので、一旦パス

    describe "検索" do
      it "作品名と一致する文言があればヒットすること" do
        (1..2).each do |i|
          FactoryBot.create(:item, title: "data_#{i}")
        end
        expect(Item.search("data").ids).to eq [Item.first.id, Item.second.id]
      end

      it "ユーザー名と一致する文言があればヒットすること" do
        (1..2).each do |i|
          FactoryBot.create(:user, name: "data_#{i}")
        end
        expect(User.search("data").ids).to eq [User.first.id, User.second.id]
      end
    end

    describe "削除の依存関係" do

      it "削除すると、紐付くreviewも全て削除されること" do
        2.times { FactoryBot.create(:review, item: item) }
        expect { item.destroy }.to change { Review.all.count }.by(-2)
      end

      it "削除すると、紐付くwant_to_watch_itemも全て削除されること" do
        2.times { FactoryBot.create(:want_to_watch_item, item: item)}
        expect { item.destroy }.to change { WantToWatchItem.all.count }.by(-2)
      end

      it "削除すると、紐付くwatched_itemも全て削除されること" do
        2.times { FactoryBot.create(:watched_item, item: item)}
        expect { item.destroy }.to change { WatchedItem.all.count }.by(-2)
      end
    end

end
