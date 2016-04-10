class Video < ApplicationRecord
  belongs_to :comedy

  has_one :youtube_link,
    as: :linker,
    dependent: :destroy

  validates :title,
    presence: true
end
