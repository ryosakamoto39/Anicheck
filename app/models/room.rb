class Room < ApplicationRecord
  has_many :messages
  has_many :entries
  has_many :notifications, dependent: :destroy
end
