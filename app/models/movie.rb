class Movie < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates :title, :user, presence: true
end
