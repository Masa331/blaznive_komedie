FactoryGirl.define do
  factory :image do
    title 'Obrázek auta'
    image { File.new(File.join(Rails.root, 'spec', 'files', 'spec_image.png')) }
  end
end
