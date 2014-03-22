# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  comedy_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#  publish      :boolean
#  published_at :datetime
#

class Video < ActiveRecord::Base

  include Publicable

  belongs_to :comedy
  has_one :link

  accepts_nested_attributes_for :link

  validates :title, presence: true
  validates :link, presence: true

  scope :publicable, -> { where(publish: true) }
end
