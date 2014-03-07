describe 'visitor in videos' do
  it 'video index page' do
    pending
    video1 = create(:video, publish: true)
    video2 = create(:video, publish: false)
    visit videos_path

    expect(page).to have_content video1.title
    expect(page).to have_no_content video2.title
    # otestovat samotne video?
  end
end
