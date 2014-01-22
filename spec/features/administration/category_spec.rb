require 'spec_helper'
describe 'Administrator in categories' do
  it "creates new category" do
    login_admin
    visit admin_categories_path

    fill_in 'Název', with: 'Nová kategorie'
    click_on 'Vytvořit kategorii'

    expect(page).to have_link 'Nová kategorie'
  end

  it "deletes category" do
    login_admin
    category = create(:category)
    visit admin_categories_path

    expect(page).to have_link category.title
    click_on 'Smazat kategorii'
    expect(page).not_to have_link category.title
  end

  it "updates category" do
    login_admin
    category = create(:category, title: 'Super název')
    visit admin_categories_path

    within "#category-#{category.id}" do
      fill_in 'Název', with: 'Nový název'
      click_on 'Upravit kategorii'
    end
    expect(page).to have_link 'Nový název'
  end
end
