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
