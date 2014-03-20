require 'spec_helper'

describe 'visitor in videos' do
  it 'on index page' do
    video1 = create(:video, publish: true, title: 'Publikované video')
    video2 = create(:video, publish: false, title: 'Nepublikované video')

    visit root_path
    click_on 'Trailery a scénky'

    expect(page).to have_content video1.title
    expect(page).to have_no_content video2.title
  end
end
