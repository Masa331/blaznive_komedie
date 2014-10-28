class Image < ActiveRecord::Base
  include Publicable

  belongs_to :comedy

  validates :title, presence: true

  has_attached_file :image, styles: { basic: '300x400'}
  validates_attachment :image, presence: true,
    content_type: { content_type: [ 'image/jpeg', 'image/png', 'image/gif' ] },
    size: { in: 0..1.megabytes}

  scope :comedy_poster, -> { where.not(comedy_id: nil) }
end
