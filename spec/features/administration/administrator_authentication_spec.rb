require 'spec_helper'

describe 'Administrator' do
  it "can sign up with valid login credentials" do
    admin = create(:admin)
    visit new_admin_session_path

    fill_in 'E-mail', with: admin.email
    fill_in 'Heslo', with: admin.password
    click_on 'Přihlásit'

    expect(page).to have_link 'Odhlásit se'
  end

  it "cant sign up with invalid login credentials" do
    admin = create(:admin)
    visit new_admin_session_path

    fill_in 'E-mail', with: admin.email
    fill_in 'Heslo', with: 'spatne heslo'
    click_on 'Přihlásit'

    expect(page).not_to have_content 'Odhlásit se'
  end

  it "can sign_out succesfully" do
    login_admin
    visit admin_posts_path
    click_on 'Odhlásit se'

    expect(page).not_to have_link 'Odhlásit se'
  end
end
