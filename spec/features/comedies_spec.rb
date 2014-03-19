require 'spec_helper'

describe 'visitor in comedies' do

  context 'on index' do
    it "does not see unpublished comedies on index" do
      comedy = create(:comedy, publish: false, cz_title: 'Slunce seno')
      visit comedies_path

      expect(page).to have_no_content 'Slunce seno'
    end

    it "sees published comedies on index" do
      comedy = create(:comedy_with_image, publish: true, cz_title: 'Slunce seno')
      visit comedies_path

      within('.large-8') do
        expect(page).to have_content 'Slunce seno'
      end
    end
  end

  context 'on show page' do
    it 'shows comedy page' do
      comedy = create(:comedy_with_image_and_video, cz_title: 'Slunce seno', en_title: 'Sun haystack')

      visit comedies_path

      within('.large-8') do
        click_on 'Slunce seno - Sun haystack'
      end
      expect(page).to have_content comedy.text
    end

    it 'follows link to next and previous comedy' do
      comedy = create(:comedy_with_image_and_video, cz_title: 'Slunce seno')
      next_comedy = create(:comedy_with_image_and_video,
                           cz_title: 'Americká krása',
                           text: 'ahoj'*50)

      visit comedy_path(comedy)

      within('.large-8') do
        click_on '← Americká krása'
      end

      expect(page).to have_content next_comedy.text

      within('.large-8') do
        click_on 'Slunce seno →'
      end

      expect(page).to have_content comedy.text
    end
  end

  context 'on list' do
    it 'searches for comedies by cz title' do
      create(:comedy_with_image, cz_title: 'Slunce seno')
      create(:comedy_with_image, cz_title: 'Ahoj Ameriko')

      visit root_path

      click_on 'Seznam komedií'

      fill_in 'search_title_search', with: 'Slunce'
      click_on 'Hledat'

      within('.large-8') do
        expect(page).to have_content 'Slunce seno'
        expect(page).to have_no_content 'Ahoj Ameriko'
      end
    end

    it 'searches for comedies by en title' do
      create(:comedy_with_image, en_title: 'Sun haystack')
      create(:comedy_with_image, en_title: 'Hi America')

      visit root_path

      click_on 'Seznam komedií'

      fill_in 'search_title_search', with: 'Hi'
      click_on 'Hledat'

      within('.large-8') do
        expect(page).to have_content 'Hi America'
        expect(page).to have_no_content 'Sun haystack'
      end
    end

    it 'searches for comedies by category' do
      en_category = create(:category, title: 'Americke')
      cz_category = create(:category, title: 'Ceske')
      create(:comedy_with_image, en_title: 'Sun haystack', category: cz_category)
      create(:comedy_with_image, en_title: 'Hi America', category: en_category)

      visit root_path

      click_on 'Seznam komedií'

      choose 'Ceske'
      click_on 'Hledat'

      within('.large-8') do
        expect(page).to have_content 'Sun haystack'
        expect(page).to have_no_content 'Hi America'
      end
    end

    it "prejde pres link v headeru na kategorii komedii" do
      en_category = create(:category, title: 'Americke')
      cz_category = create(:category, title: 'Ceske')
      comedy = create(:comedy_with_image_and_video, en_title: 'Sun haystack', category: cz_category)
      create(:comedy_with_image_and_video, en_title: 'Hi America', category: en_category)

      visit comedy_path(comedy)

      within('.large-8') do
        click_on 'Ceske'
      end

      within('.large-8') do
        expect(page).to have_content 'Sun haystack'
        expect(page).to have_no_content 'Hi America'
      end
    end
  end

end
