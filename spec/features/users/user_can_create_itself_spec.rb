require 'rails_helper'

RSpec.feature "unauthenticated user can create an account" do
  before(:each) do
    reset_session!
  end
  
  scenario "and be re-directed to the root" do
  user_attributes = {
    username: "michaelc",
    password: "mypassword"
    }

    visit new_user_path
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Account"

    user = User.last

    expect(page).to have_content("Welcome, #{user.username}")
    expect(current_path).to eq(root_path)
  end
end
