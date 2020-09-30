class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :followed_id, uniqueness: { scope: :follower_id }
  validate :self_follow

  private

  def self_follow
    return unless follower_id && followed_id

    errors.add(:followed_id, '自分自身をフォローすることはできません') if follower_id == followed_id
  end
end
