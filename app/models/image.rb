# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  comedy_id          :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  alt                :string(255)
#  publish            :boolean
#

class Image < ActiveRecord::Base
  belongs_to :comedy

  validates :title, presence: true

  scope :publicable, -> { where(publish: true) }
  scope :comedy_poster, -> { where.not(comedy_id: nil) }

  has_attached_file :image, styles: { basic: '300x400'}
  validates_attachment :image, presence: true,
    content_type: { content_type: [ 'image/jpeg', 'image/png', 'image/gif' ] },
    size: { in: 0..1.megabytes}

end
