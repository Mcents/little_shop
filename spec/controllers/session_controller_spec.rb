require 'rails_helper'

RSpec.feature "As a user" do
  scenario "I cannot login without my username" do
    user_attributes = {
      username: "usericus",
      password: "password"
      }
    user = User.create(user_attributes)
    visit login_path

    fill_in "session[username]", with: user_attributes[:username]
    page.all(:css, '.login-button-unique')[0].click

    expect(current_path).to eq(login_path)
  end

  scenario "I cannot login without my password" do
    user_attributes = {
      username: "usericus",
      password: "password"
      }
    user = User.create(user_attributes)
    visit login_path

    fill_in "session[password]", with: user_attributes[:password]
    page.all(:css, '.login-button-unique')[0].click

    expect(current_path).to eq(login_path)
  end
end
