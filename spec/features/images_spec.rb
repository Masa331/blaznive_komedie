require 'spec_helper'

describe 'visitor in images' do
  it 'on index page it shows published images which belongs to comedy' do
    comedy_image = create(:image, publish: true, title: 'Slunce seno')
    image1 = create(:image, publish: true, title: 'Publikovaný obrázek')
    image2 = create(:image, publish: false, title: 'Nepublikovaný obrázek')
    comedy = create(:comedy, image: comedy_image)

    visit root_path
    click_on 'Plakáty'

    expect(page).to have_content comedy_image.title
    expect(page).to have_no_content image1.title
    expect(page).to have_no_content image2.title
  end
end
