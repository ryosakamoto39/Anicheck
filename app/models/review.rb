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

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and review_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        review_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

    def create_notification_comment!(current_user, comment_id)
      # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
      temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
      temp_ids.each do |temp_id|
        save_notification_comment!(current_user, comment_id, temp_id['user_id'])
      end
      # まだ誰もコメントしていない場合は、投稿者に通知を送る
      save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end

    def save_notification_comment!(current_user, comment_id, visited_id)
      # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
      notification = current_user.active_notifications.new(
        review_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
