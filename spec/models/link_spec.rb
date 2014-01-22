require 'spec_helper'

describe Link do
  it { expect(subject).to validate_presence_of :href }
end
