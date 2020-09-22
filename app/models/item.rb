class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :story, presence: true, length: { maximum: 800 }
  mount_uploader :image, ImageUploader
  has_many :reviews
  has_many :want_to_watch_items
  has_many :watched_items
  acts_as_taggable

  def average_score
    count = reviews.count
    return 0 if count.zero? # 未レビューの場合は、0点とする

    reviews.sum(:score) / count
  end

  def self.popular_ids
    Hash[Item.rank.sort_by { |_, score| -score }].keys
  end

  def self.rank
    border_score = 1 # 1点を超えない商品は除く
    weight = -3 # 5点満点のレビューで3点を0点、5点を2点として評価を再マッピングするために使用する
  # 1点がたくさん集まるより、低評価が少なく、高得点のみを獲得している方が評価が高いため

    original_score = Review.group(:item_id).sum(:score) # item_id毎にreviewのスコアを集計
    review_count = Review.group(:item_id).count # item毎のreviewを集計

    total_score = original_score.merge(review_count) { |_key, score, count| score + count * weight } # Σ(review.score - 3)と同じ計算式
    total_score.delete_if do |_key, score|
      score <= border_score # border_score以下のitem取り除く
    end
  end

  # 観た！の降順にidを返す
 def self.watched_ids
   watched_count = WatchedItem.group(:item_id).count
   watched_count.sort_by { |_, count| -count }.to_h.keys
 end

 # 観たい！の降順にidを返す
 def self.want_to_watch_ids
   want_count = WantToWatchItem.group(:item_id).count
   want_count.sort_by { |_, count| -count }.to_h.keys
 end

 # あるタグが付いたレビューを持つ商品を、タグ付け回数の降順に返す
   def self.tagged_desc(tag_name)
     # 対象タグのidを割り出す
     tag_id = ActsAsTaggableOn::Tag.find_by(name: tag_name).id

     # 対象タグの付けられたreviewのidを割り出す
     review_ids = ActsAsTaggableOn::Tagging.where(tag_id: tag_id).pluck(:taggable_id)

     # 対象タグが付いたレビューをitem_id毎に数えることで、itemに対するtag付け回数を計算する
     tag_count = Review.where(id: review_ids).group(:item_id).count

     # item_idの配列を出現回数の降順に並び替え、ハッシュ化してキー(id)を取り出す
     item_ids = tag_count.sort_by { |_, count| -count }.to_h.keys

     # 降順のidでtagを抽出する。orderを明示的に指定しなければ、tag_idsの順番通りにならない
     Item.where(id: item_ids).order([Arel.sql('field(id, ?)'), item_ids])
   end

   def self.search(keyword)
     search = "%" + keyword + "%"
     Item.eager_load(:reviews, :tags).where('items.title like ? or items.story like ? or tags.name like ?', search, search, search)
   end


end
