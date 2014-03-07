require 'spec_helper'
# describe 'Administrator in images' do
#   it "creates new image" do
#     login_admin
#     visit admin_images_path
#
#     fill_in 'Název', with: 'Nová kategorie'
#     attach_file 'image_image', 'spec/files/spec_image.png'
#     click_on 'Vytvořit obrázek'
#
#     expect(page).to have_link 'Nová kategorie'
#   end
#
#   it "deletes image" do
#     login_admin
#     image = create(:image)
#     visit admin_images_path
#
#     expect(page).to have_link image.title
#     click_on 'Smazat obrázek'
#     expect(page).not_to have_link image.title
#   end
#
#   it "updates image" do
#     login_admin
#     image = create(:image, title: 'Super název')
#     visit admin_images_path
#
#     within "#image-#{image.id}" do
#       fill_in 'Název', with: 'Nový název'
#       click_on 'Upravit obrázek'
#     end
#     expect(page).to have_link 'Nový název'
#   end
# end
