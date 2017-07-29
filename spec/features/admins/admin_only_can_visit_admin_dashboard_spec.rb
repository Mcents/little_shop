require 'rails_helper'

RSpec.feature "Admin can access the admin dashboard" do
  scenario "only when logged in with admin privledges" do
    user = User.create(username: "michael", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/admin/dashboard"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")


  end
end
