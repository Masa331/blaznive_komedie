# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  video_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  type        :string(255)
#  uri         :string(255)
#  linker_id   :integer
#  linker_type :string(255)
#

class YoutubeLink < Link

end
