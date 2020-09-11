class Review < ApplicationRecord
  validates :score, presence: true
  validates :content, presence: true, length: { maximum: 400 }
  validates :user_id, presence: true
  validates :item_id, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :item
  has_many :review_likes, dependent: :destroy
  acts_as_taggable
  
end
