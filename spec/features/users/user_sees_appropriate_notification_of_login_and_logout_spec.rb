require 'rails_helper'

RSpec.feature "As a registered user" do
  scenario "I am appropriately notified of login status" do
    user_attributes = {
      username: "usericus",
      password: "password"
      }

    visit root_path


    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq('/welcome')
    expect(page).to have_content("Logged in #{user.username}")
  end
end
