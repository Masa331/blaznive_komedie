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

require 'spec_helper'

describe Link do
  # it { expect(subject).to validate_presence_of :href }
end
