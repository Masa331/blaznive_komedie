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

require 'spec_helper'

describe Video do
  it { expect(subject).to belong_to :comedy  }
  it { expect(subject).to have_one :link }
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to validate_presence_of :link }

  describe '.publicable' do
    it "returns videos which have publish = true" do
      video = create(:video, publish: true)
      non_publicable_video = create(:video, publish: false)

      expect(Video.publicable).to eq [ video ]
    end
  end
end
