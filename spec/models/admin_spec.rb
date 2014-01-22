require 'spec_helper'

describe Admin do
  it { expect(subject).to validate_presence_of :email }
end
