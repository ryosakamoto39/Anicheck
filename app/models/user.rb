class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy
  has_many :review_likes, dependent: :destroy
  has_many :want_to_watch_items
  has_many :watched_items
  has_many :comments
  has_many :comment_likes
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy  

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    return active_relationships.find_by(followed_id: user.id).destroy if following?(user)

    nil
  end

  def following?(user)
    following.include?(user)
  end


end
