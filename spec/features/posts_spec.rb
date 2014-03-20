require 'spec_helper'

describe 'visitor within posts' do
  it 'on index page' do
    post1 = create(:post, publish: true, title: 'Viditelný článek')
    post2 = create(:post, publish: false, title: 'Neviditelný článek')

    visit root_path
    click_on 'Články'

    expect(page).to have_link post1.title
    expect(page).to have_no_content post2.title
  end
end
