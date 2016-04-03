class Image < ApplicationRecord
  belongs_to :comedy

  validates :title, presence: true

  scope :comedy_poster, -> { where.not(comedy_id: nil) }
end
