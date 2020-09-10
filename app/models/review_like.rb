class ReviewLike < ApplicationRecord
  validates :user_id, presence: true
  validates :review_id, presence: true
  belongs_to :user
  belongs_to :review
end
