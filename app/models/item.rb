class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :story, presence: true, length: { maximum: 800 }
  mount_uploader :image, ImageUploader
  has_many :reviews
  has_many :want_to_watch_items
  has_many :watched_items

end
