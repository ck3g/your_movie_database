class Picture < ApplicationRecord
  belongs_to :movie

  validates :movie, presence: true

  mount_uploader :picture, PictureUploader
end
