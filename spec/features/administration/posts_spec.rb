require 'spec_helper'
# describe 'Administrator in posts' do
#   it "adds new post" do
#     login_admin
#     category = create(:category)
#     visit new_admin_post_path
#
#     fill_in 'Název', with: 'Nová komedie'
#     fill_in 'Text', with: 'a' * 101
#     select category.title, from: 'Kategorie'
#     check 'Zveřejnit článek'
#     click_on 'Přidat článek'
#
#     expect(page).to have_link 'Nová komedie'
#     expect(page).to have_content category.title
#   end
#
#   it "deletes post" do
#     login_admin
#     comedy = create(:post)
#     visit admin_posts_path
#
#     expect(page).to have_link comedy.title
#     click_on 'Smazat článek'
#     expect(page).not_to have_link comedy.title
#   end
#
#   it "updates post" do
#     login_admin
#     comedy = create(:post)
#     other_category = create(:category, title: 'Jiná kategorie')
#     visit admin_post_path(comedy)
#
#     fill_in 'Název', with: 'Nový název'
#     fill_in 'Text', with: 'jiný text' * 61
#     select other_category.title, from: 'Kategorie'
#     uncheck 'Zveřejnit článek'
#     click_on 'Upravit článek'
#
#     expect(page).to have_link 'Nový název'
#     expect(page).to have_content other_category.title
#     expect(page).to have_content 'Nezveřejněno'
#   end
# end
