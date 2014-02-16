# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  href       :string(255)
#  video_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :href, presence: true
end
