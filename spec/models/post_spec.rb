require 'spec_helper'

describe Post do
 it { expect(subject).to belong_to(:category) }
 it { expect(subject).to validate_presence_of(:title) }
 it { expect(subject).to have_many(:images) }
 it { expect(subject).to have_many(:videos) }
 it { expect(subject).to validate_presence_of(:text) }
 it { expect(subject).to ensure_length_of(:text).is_at_least(100) }
end
