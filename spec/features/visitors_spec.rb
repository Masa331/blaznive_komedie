require 'spec_helper'

describe 'Visitor on web' do
  describe 'contacts page' do
    it "sees contacts" do
      visit root_path
      expect(page).to have_content 'Kontakty'
    end
  end

  describe 'within posts' do
    it "does not see unpublished post on index" do
      comedy = create(:comedy_post, published: false)
      visit comedy_post_path(comedy)

      expect(page).to have_content 'Stránka nenalezena'
    end

    it 'shows post page' do
      comedy = create(:comedy_post)
      visit comedy_post_path(comedy)

      expect(page).to have_content comedy.title
      expect(page).to have_content comedy.body
      expect(page).to have_link comedy.category
      expect(page).to have_link comedy.created_at
    end

    it 'shows posts index page' do
      comedy1 = create(:comedy_post)
      comedy2 = create(:comedy_post)
      unpublished_comedy = create(:comedy_post, published: false)
      visit comedy_posts_path

      expect(page).to have_link comedy1.title
      expect(page).to have_link comedy2.title
      expect(page).to have_link comedy2.title
      expect(page).not_to have_content unpublished_comedy.title
    end
  end

  it 'video index page' do
    video1 = create(:video)
    video2 = create(:video)
    visit videos_path

    expect(page).to have_content video1.title
    expect(page).to have_content video2.title
    # otestovat samotne video?
  end

  it 'shows category index' do
    romantic_category = create(:category, title: 'Romantic')
    anime_category = create(:category, title: 'Anime')
    comedy1 = create(:comedy_post, category: romantic_category)
    comedy2 = create(:comedy_post, category: animecategory)

    expect(page).to have_content romantic_category.title
    expect(page).to have_content anime_category.title

    expect(page).to have_link comedi1.title
    expect(page).to have_link comedi2.title
  end

  it 'searches for all posts by title' do
    # TODO
  end

  it 'shows tags page' do
    # TODO
  end

  it 'shows tags index' do
    # TODO
  end
end
