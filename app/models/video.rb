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
  has_one :youtube_link, as: :linker

  accepts_nested_attributes_for :youtube_link

  validates :title, presence: true
  validates :youtube_link, presence: true

  scope :publicable, -> { where(publish: true) }
end
