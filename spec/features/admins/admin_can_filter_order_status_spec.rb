require 'rails_helper'

RSpec.feature "Admin can filter orders by status" do
  scenario "and see only those orders" do

    pro_user = User.create!(username: "johnson", password: "tingy", role: 0)
    order = Order.create!(user_id: pro_user.id, status: 0)
    order2 = Order.create!(user_id: pro_user.id, status: 1)
    user = User.create(username: "mikey", password: "yeahyeah", role: 1)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path
    click_on "Ordered"
    expect(page).to have_content("johnson")
  end

  scenario "and change statuses by clicking" do
    pro_user = User.create!(username: "johnson", password: "tingy", role: 0)
    avid_user = User.create!(username: "robinson", password: "stingy", role: 0)

    order = Order.create!(user_id: pro_user.id, status: 0)
    order2 = Order.create!(user_id: avid_user.id, status: 1)
    
    user = User.create(username: "mikey", password: "yeahyeah", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path
    click_on "Paid"
    expect(page).to have_content("robinson")
    click_button("Cancel")
    expect(page).to_not have_content("robinson")

    click_link("Back to Dashboard")
    click_on "Ordered"
    expect(page).to have_content("johnson")
    click_button("Mark Paid")

    expect(page).to_not have_content("johnson")
    click_link("Back to Dashboard")
    click_on "Paid"
    expect(page).to have_content("johnson")
    click_button("Mark Completed")
    expect(page).to_not have_content("johnson")
    click_link("Back to Dashboard")
  end
end
