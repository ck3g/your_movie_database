class Movie < ApplicationRecord
  RECENT_MOVIES_COUNT = 8

  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates :title, :user, presence: true

  scope :recent, -> { new_first.limit(RECENT_MOVIES_COUNT) }
  scope :new_first, -> { order(created_at: :desc) }
end
