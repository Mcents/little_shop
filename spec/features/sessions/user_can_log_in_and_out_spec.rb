require 'rails_helper'

RSpec.feature "User can log in and out of a session" do
  before(:each) do
    reset_session!
  end

  scenario "with valid credentials" do
    user_attributes = {
      username: "michaelc",
      password: "mypassword"
      }
    user = User.create(user_attributes)

    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user_attributes[:password]

    page.all(:css, '.login-button-unique')[0].click

    expect(current_path).to eq(root_path)
    expect(page).to have_content(user.username)
    expect(page).to have_content("Successful login")

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content(user.username)
   end
end
