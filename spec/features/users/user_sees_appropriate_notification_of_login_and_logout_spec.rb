require 'rails_helper'

RSpec.feature "As a registered user" do
  scenario "I am appropriately notified of login status" do
    user_attributes = {
      username: "usericus",
      password: "password"
      }
    user = User.create(user_attributes)
    visit root_path

    page.all(:css, '.login-navbar-unique')[0].click

    expect(current_path).to eq(login_path)


    fill_in "session[username]", with: user_attributes[:username]
    fill_in "session[password]", with: user_attributes[:password]
    page.all(:css, '.login-button-unique')[0].click

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{user.username}")
  end
end
