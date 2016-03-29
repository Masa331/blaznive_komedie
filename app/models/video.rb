class Video < ApplicationRecord
  include Publicable

  belongs_to :comedy
  has_one :youtube_link, as: :linker

  validates :title, presence: true
end
