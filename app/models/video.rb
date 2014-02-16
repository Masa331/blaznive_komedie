# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  comedy_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  publish    :boolean
#

class Video < ActiveRecord::Base
  belongs_to :comedy
  has_one :link

  accepts_nested_attributes_for :link

  validates :title, presence: true
  validates :link, presence: true

  scope :publicable, -> { where(publish: true) }
end
