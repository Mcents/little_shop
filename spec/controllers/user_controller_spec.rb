require 'rails_helper'

RSpec.feature "User cannot " do
  scenario "edit their profile without a password" do
    user1 = User.create(username: "usericus", password: "password", role: 0)
    visit login_path
    fill_in "session[username]", with: "usericus"
    fill_in "session[password]", with: "password"
    page.all(:css, '.login-button-unique')[0].click

    visit dashboard_path
    # save_and_open_page
    click_on "Edit User"
    fill_in "user[username]", with: "newuser"
    click_on "Update Account"

    expect(current_path).to eq(user_path(user1))
  end

  scenario "edit their profile without a username" do
    user1 = User.create(username: "usericus", password: "password", role: 0)
    visit login_path
    fill_in "session[username]", with: "usericus"
    fill_in "session[password]", with: "password"
    page.all(:css, '.login-button-unique')[0].click

    visit dashboard_path
    # save_and_open_page
    click_on "Edit User"
    fill_in "user[username]", with: ""
    fill_in "user[password]", with: "password"
    click_on "Update Account"

    expect(current_path).to eq(user_path(user1))
  end

  scenario "create an account without a username" do
    visit new_user_path
    fill_in "user[password]", with: "password"
    click_on "Create Account"
    expect(current_path).to eq(new_user_path)
  end

  scenario "create an account without a password" do
    visit new_user_path
    fill_in "user[username]", with: "username"
    click_on "Create Account"
    expect(current_path).to eq(new_user_path)
  end
end
