# == Schema Information
#
# Table name: comedies
#
#  id           :integer          not null, primary key
#  cz_title     :string(255)
#  text         :text
#  publish      :boolean
#  category_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  en_title     :string(255)
#  slug         :string(255)
#  published_at :datetime
#

require 'spec_helper'

describe Comedy do

  it_behaves_like 'publicable'

  it { expect(subject).to validate_presence_of :text }
  it { expect(subject).to ensure_length_of(:text).is_at_least(100) }
  it { expect(subject).to validate_presence_of :category }

  describe '.publicable' do
    it "returns comedys which have publish = true" do
      comedy = create(:comedy, publish: true)
      non_publicable_comedy = create(:comedy, publish: false)

      expect(Comedy.publicable).to eq [ comedy ]
    end
  end

  describe '.title_search' do
    it "returns comedy which cz or en title matcher given string" do
      en_comedy = create(:comedy, en_title: 'Pilot knows', cz_title: 'xxx')
      cz_comedy = create(:comedy, cz_title: 'Vtipný pilot', en_title: 'xxx')
      other_comedy = create(:comedy, en_title: 'Hello there', cz_title: 'Ahoj!')

      expect(Comedy.title_search('pilot')).to eq [ en_comedy, cz_comedy ]
    end
  end

  describe '.next_by_id' do
    it "returns next comedy by id" do
      first_comedy = create(:comedy)
      second_comedy = create(:comedy)
      third_comedy = create(:comedy)

      expect(Comedy.next_by_id(second_comedy.id)).to eq third_comedy
    end
  end

  describe '.previous_by_id' do
    it "returns previous comedy by id" do
      first_comedy = create(:comedy)
      second_comedy = create(:comedy)
      third_comedy = create(:comedy)

      expect(Comedy.previous_by_id(second_comedy.id)).to eq first_comedy
    end
  end

  describe '.random' do
    it "returns given number of random comedies" do
      comedy1 = create(:comedy)
      comedy2 = create(:comedy)

      random_comedies = Comedy.random(1)
      expect(random_comedies.size).to eq 1
      expect(random_comedies.first).to be_kind_of Comedy
    end

    it "defaultly returns 5 random comedies"
  end

  describe "#bilingual_title" do
    it "returns string with both cz and en title concatenated by dash" do
      comedy = create(:comedy, cz_title: 'Cesky', en_title: 'Anglicky')
      expect(comedy.bilingual_title).to eq 'Cesky - Anglicky'
    end
    it "doesnt concatenate nil cz_title"
    it "doesnt concatenate nil en_title"
  end
end
