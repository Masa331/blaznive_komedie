require 'spec_helper'
describe 'visitor within posts' do
  it 'shows posts index page' do
    pending
    comedy1 = create(:comedy)
    comedy2 = create(:comedy)
    unpublish_comedy = create(:comedy, publish: false)
    visit comedys_path

    expect(page).to have_link comedy1.title
    expect(page).to have_link comedy2.title
    expect(page).to have_link comedy2.title
    expect(page).not_to have_content unpublish_comedy.title
  end
end
