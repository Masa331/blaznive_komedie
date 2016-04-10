class Image < ApplicationRecord
  belongs_to :comedy

  validates :title,
    presence: true
end
