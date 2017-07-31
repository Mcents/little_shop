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
save_and_open_page 
    expect(page).to have_content("johnson")
  end
end
    
                       
