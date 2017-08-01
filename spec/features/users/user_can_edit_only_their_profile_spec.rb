 require 'rails_helper'

 RSpec.feature "User can edit their profile" do
   scenario "and see their updated information" do
     user1 = User.create(username: "micha", password: "guy", role: 1)
     user2 = User.create(username: "thingy", password: "alsoguy", role: 0)
     visit login_path
     fill_in "session[username]", with: "micha"
     fill_in "session[password]", with: "guy"     
    page.all(:css, '.login-button-unique')[0].click

     visit user_path(user1)
     click_on "Edit User"
     fill_in "user[username]", with: "newuser"
     fill_in "user[password]", with: user1.password
     click_on "Update Account"

     expect(current_path).to eq(dashboard_path)
     expect(page).to have_content("Welcome newuser")
   end

   scenario "but not be able to edit other users profiles" do
     user1 = User.create(username: "micha", password: "guy", role: 1)
     user2 = User.create(username: "thingy", password: "alsoguy", role: 0)
     visit login_path
     fill_in "session[username]", with: "micha"
     fill_in "session[password]", with: "guy"     
    page.all(:css, '.login-button-unique')[0].click

     visit "/users/#{user2.id}/edit"
     expect(page).to have_content("The page you were looking for doesn't exist")
   end
 end
