class Review < ApplicationRecord
  validates :score, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :item
  has_many :review_likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  acts_as_taggable

  def self.popular_ids
    # 配列をハッシュ化して、スコアが高い順にkeyを取り出す
    Hash[Review.rank.sort_by { |_, score| -score }].keys
  end

  # topページのランキング用に、いいね！とコメントの数を集計し、合計ポイントを計算する
  def self.rank
    like_weight = 4 # 1いいねの重み
    comment_weight = 3 # 1コメントの重み

    # group.countでは0が集計されないため、初期値0のハッシュを生成する
    array = []
    Review.pluck(:id).each do |id|
      array += [[id, 0]]
    end
    zero_hash = array.to_h

    # review_id毎にいいねとコメントの数を集計し、ハッシュとして返す
    like_count_omit_zero = ReviewLike.group(:review_id).count
    like_count = like_count_omit_zero.merge(zero_hash) { |_key, v, zero| v + zero }

    comment_count_omit_zero = Comment.group(:review_id).count
    comment_count = comment_count_omit_zero.merge(zero_hash) { |_key, v, zero| v + zero }

    # いいね、コメントに重みをかけて、ハッシュのキー毎にスコアを再計算する
    like_count.merge(comment_count) { |_key, like, comment| like * like_weight + comment * comment_weight }
  end

  def self.search(keyword)
    search = '%' + keyword + '%'
    eager_load(:tags).where('reviews.content like ? or tags.name like ? or items.title like ?', search, search, search)
  end
end
