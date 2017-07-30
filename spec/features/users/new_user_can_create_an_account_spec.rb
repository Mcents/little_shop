require 'rails_helper'

RSpec.feature "new user can create an account" do
  scenario "and be redirected to dashboard" do
    user_attributes = {
      username: "usericus",
      password: "password"
      }
    visit root_path

    page.all(:css, '.login-navbar-unique')[0].click

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Create an Account")

    page.all(:css, '.user-creation')[0].click

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[confirm_password]", with: user_attributes[:password]
    click_on "Create Account"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{User.last.username}")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome #{User.last.username}")

  end
end
