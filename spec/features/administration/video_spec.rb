require 'spec_helper'
# describe 'Administrator in videos' do
#   it "creates new video" do
#     login_admin
#     visit admin_videos_path
#
#     fill_in 'Název', with: 'Nové video'
#     fill_in 'Link', with: 'www.seznam.cz'
#     click_on 'Vytvořit video'
#
#     expect(page).to have_link 'Nové video'
#   end
#
#   it "deletes video" do
#     login_admin
#     video = create(:video)
#     visit admin_videos_path
#
#     click_on 'Smazat video'
#     expect(page).not_to have_link video.title
#   end
#
#   it "updates video" do
#     login_admin
#     video = create(:video, title: 'Super název')
#     visit admin_videos_path
#
#     within "#video-#{video.id}" do
#       fill_in 'Název', with: 'Nový název'
#       click_on 'Upravit video'
#     end
#
#     expect(page).to have_link 'Nový název'
#   end
# end
