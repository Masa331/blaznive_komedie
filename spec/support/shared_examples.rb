shared_examples 'publicable' do

  describe '.publicable' do
    it "returns subjects which have publish = true" do
      publicable = create(described_class, publish: true)
      non_publicable = create(described_class, publish: false)

      expect(described_class.publicable).to eq [ publicable ]
    end
  end

  describe 'publicable?' do
    it "returns true if subject is publicable" do
      publicable = build(described_class, publish: true)
      expect(publicable).to be_publicable
    end

    it "returns false if subject is not publicable" do
      non_publicable = build(described_class, publish: false)
      expect(non_publicable).not_to be_publicable
    end
  end

  describe 'after_update if: :publish_changed?' do
    it "it updates pubicated_at anytime publish is changed" do
      described = create(described_class, publish: false)

      Delorean.time_travel_to Date.parse('2.10.1990') do
        described.update(publish: true)
      end
      # kontroluju den pozdeji protoze time travel nastavi cas na 00:00 a kazdy si to jinak vyklada nebo tak neco
      expect(described.reload.published_at.to_date).to eq Date.parse('1.10.1990')

      Delorean.time_travel_to Date.parse('3.10.1990') do
        described.update(publish: false)
      end
      expect(described.reload.published_at.to_date).to eq Date.parse('2.10.1990')
    end
  end
end
