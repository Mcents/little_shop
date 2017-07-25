require 'rails_helper'

RSpec.feature "User can log into session" do 
  scenario "with valid credentials" do
  user_attributes = {
    username: "michaelc",
    password: "mypassword"
    }
  user = User.create(user_attributes)
  
  visit login_path
  fill_in "session[username]", with: user.username
  fill_in "session[password]", with: user.password
  click_on "Login"
  
  expect(page).to have_content("Successful login")
  expect(page).to have_content(user.username)
  expect(current_path).to eq(root_path)
  end
end
