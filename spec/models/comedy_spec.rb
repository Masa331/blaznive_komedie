require 'rails_helper'

RSpec.describe Comedy do
  describe '#bilingual_title' do
    it 'returns cz_title and en_title joined by dash' do
      comedy = Comedy.new(cz_title: 'Děsnej biják', en_title: 'Scary Movie')

      expect(comedy.bilingual_title).to eq 'Děsnej biják - Scary Movie'
    end
  end

  describe '#to_s' do
    it 'returns bilingual_title' do
      comedy = Comedy.new
      expect(comedy).to receive(:bilingual_title) { 'Komedie - Comedy' }

      expect(comedy.to_s).to eq 'Komedie - Comedy'
    end
  end
end
