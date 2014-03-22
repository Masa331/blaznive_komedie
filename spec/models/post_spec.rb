# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  text         :text
#  title        :string(255)
#  publish      :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  preface      :text
#  published_at :datetime
#

require 'spec_helper'

describe Post do

  it_behaves_like 'publicable'

  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to validate_presence_of :text }
  it { expect(subject).to validate_presence_of :preface }
  it { expect(subject).to ensure_length_of(:preface).is_at_least(100).is_at_most(300) }

  describe '.publicable' do
    it "returns posts which have publish = true" do
      post = create(:post, publish: true)
      non_publicable_post = create(:post, publish: false)

      expect(Post.publicable).to eq [ post ]
    end
  end
end
