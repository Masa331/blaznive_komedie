require 'spec_helper'

describe 'visitor within contacts page' do
  it "contacts me through mail form" do
    pending
    visit root_path
    expect(page).to have_content 'Kontakty'
  end
end
