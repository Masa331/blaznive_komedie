require 'rails_helper'

RSpec.describe NullUser, :type => :model do
  describe '#admin?' do
    it "returns true if user's email is pdonat@seznam.cz" do
      user = NullUser.new

      expect(user.admin?).to eq false
    end
  end
end
