require 'spec_helper'

describe 'visitor in comedies' do

  it "does not see unpublished comedies on index" do
    comedy = create(:comedy, publish: false, cz_title: 'Slunce seno')
    visit comedies_path

    expect(page).to have_no_content 'Slunce seno'
  end

  it "sees published comedies on index" do
    comedy = create(:comedy_with_image, publish: true, cz_title: 'Slunce seno')
    visit comedies_path

    expect(page).to have_content 'Slunce seno'
  end

  it 'shows comedy page' do
    comedy = create(:comedy_with_image_and_video, cz_title: 'Slunce seno', en_title: 'Sun haystack')
    visit comedy_path(comedy)

    expect(page).to have_content comedy.text
  end

  it 'searches for comedies by title' do
  end

end
