require 'spec_helper'

describe Video do
  it { expect(subject).to belong_to :category  }
  it { expect(subject).to have_one :link }
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to validate_presence_of :link }
end
