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
end
