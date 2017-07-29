require 'rails_helper'

RSpec.feature "Admin can log in" do
  scenario "and be directed to admin dashboard" do
    user = User.create(username: "alligatorshoe", password: "othershoe", role: 1)

    visit login_path

    fill_in :Username, with: user.username
    fill_in :Password, with: user.password
    page.all(:css, '.login-button-unique')[0].click

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
end
