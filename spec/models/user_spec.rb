require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#admin?' do
    it "returns true if user's email is pdonat@seznam.cz" do
      user = User.new(email: 'pdonat@seznam.cz')

      expect(user.admin?).to eq true
    end

    it 'returns false otherwise' do
      user = User.new(email: 'novak@seznam.cz')

      expect(user.admin?).to eq false
    end
  end
end
