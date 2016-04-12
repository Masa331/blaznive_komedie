require 'rails_helper'

RSpec.describe 'User on homepage' do
  scenario 'sees all comedies' do
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
end
