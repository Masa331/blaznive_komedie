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

require 'spec_helper'

describe Image do
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to have_attached_file :image }
  it { expect(subject).to belong_to(:category) }
  it { expect(subject).to have_attached_file(:image) }
  it { expect(subject).to validate_attachment_presence(:image) }

  it { expect(subject).to validate_attachment_content_type(:image).
      allowing('image/png', 'image/jpeg', 'image/gif') }

  it { expect(subject).to validate_attachment_size(:image).
      less_than(1.megabytes) }
end
