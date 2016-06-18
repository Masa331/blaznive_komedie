require 'rails_helper'

RSpec.describe 'User' do
  before do
    comedy1 = Comedy.create!(cz_title: 'Děsnej biják', en_title: 'Scary Movie',
                            text: "Lorem ipsum dolor #{'a' * 90}", tag_list: 'Wayans, cool')
    Image.create!(comedy: comedy1, title: 'titulek', image_url: 'obrazek.cz')
    comedy2 = Comedy.create!(cz_title: 'Děsnej dupák', en_title: 'Dance Flick',
                            text: "Okoto ototo prototo #{'a' * 90}")
    Image.create!(comedy: comedy2, title: 'titulek', image_url: 'obrazek.cz')

    video = Video.create!(comedy: comedy1, title: 'Video')
    YoutubeLink.create!(linker: video, uri: 'video.cz')
  end

  scenario "sees all comedies on their's index" do
    visit root_path

    expect(page).to have_content 'Děsnej biják - Scary Movie'
    expect(page).to have_content 'Lorem ipsum dolor'

    expect(page).to have_content 'Děsnej dupák - Dance Flick'
    expect(page).to have_content 'Okoto ototo prototo'
  end

  scenario 'visits comedy show page' do
    visit root_path

    expect(page).to have_content 'Děsnej biják - Scary Movie'

    click_on 'Děsnej biják - Scary Movie', match: :first

    expect(page).to have_content 'Děsnej biják - Scary Movie'
    expect(page).to have_content 'Lorem ipsum dolor'
    expect(page).to have_content 'Wayans'
    expect(page).to have_content 'cool'
  end

  scenario 'searches through comedies' do
    visit root_path

    fill_in 'search_term', with: 'biják'
    click_on 'Hledat'

    within '.blog-main' do
      expect(page).to have_content 'Děsnej biják - Scary Movie'
      expect(page).to have_no_content 'Marmaduke'
    end
  end
end
