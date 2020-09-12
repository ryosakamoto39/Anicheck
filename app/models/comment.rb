class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user
  belongs_to :review
end
