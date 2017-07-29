require 'rails_helper'

RSpec.feature "Admin can access the admin dashboard" do
  scenario "and see the admin dashboard" do
    user = User.create(username: "michael", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/admin/dashboard"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
end
describe "as a registered user when I visit /admin/dashboard" do
  scenario "I see a 404" do
    user = User.create(username: "mikeey", password: "passey", role: 0)

    visit '/admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
