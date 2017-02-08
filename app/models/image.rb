class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :comedy

  validates :title,
    presence: true
end
