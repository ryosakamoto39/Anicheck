class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :story, presence: true, length: { maximum: 800 }

end
