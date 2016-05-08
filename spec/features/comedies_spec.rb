require 'rails_helper'

RSpec.describe 'User' do
  scenario "sees all comedies on their's index" do
    comedy = Comedy.create!(cz_title: 'Děsnej biják', en_title: 'Scary Movie',
                            text: "Lorem ipsum dolor #{'a' * 90}")
    comedy = Comedy.create!(cz_title: 'Děsnej dupák', en_title: 'Dance Flick',
                            text: "Okoto ototo prototo #{'a' * 90}")

    visit root_path

    expect(page).to have_content 'Děsnej biják - Scary Movie'
    expect(page).to have_content 'Lorem ipsum dolor'

    expect(page).to have_content 'Děsnej dupák - Dance Flick'
    expect(page).to have_content 'Okoto ototo prototo'
  end

  scenario 'visits comedy show page' do
    comedy = Comedy.create!(cz_title: 'Děsnej biják',
                            en_title: 'Scary Movie',
                            text: "Lorem ipsum dolor #{'a' * 90}",
                            tag_list: 'Wayans, cool')

    visit root_path

    expect(page).to have_content 'Děsnej biják - Scary Movie'

    click_on 'Děsnej biják - Scary Movie', match: :first

    expect(page).to have_content 'Děsnej biják - Scary Movie'
    expect(page).to have_content 'Lorem ipsum dolor'
    expect(page).to have_content 'Wayans'
    expect(page).to have_content 'cool'
  end

  scenario 'searches through comedies' do
    comedy = Comedy.create!(cz_title: 'Děsnej biják',
                            en_title: 'Scary Movie',
                            text: "Lorem ipsum dolor #{'a' * 90}")
    comedy = Comedy.create!(cz_title: 'Marmaduke',
                            en_title: 'Marmaduke',
                            text: "Lorem ipsum dolor #{'a' * 90}")

    visit root_path

    fill_in 'search_term', with: 'biják'
    click_on 'Hledat'

    within '.blog-main' do
      expect(page).to have_content 'Děsnej biják - Scary Movie'
      expect(page).to have_no_content 'Marmaduke'
    end
  end
end
