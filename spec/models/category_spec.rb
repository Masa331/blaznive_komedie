require 'spec_helper'

describe Category do
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to have_many :posts }
  it { expect(subject).to have_many :images }
  it { expect(subject).to have_many :videos }
end
