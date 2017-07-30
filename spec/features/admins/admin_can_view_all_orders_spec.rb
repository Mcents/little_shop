require 'rails_helper'

RSpec.feature "Admin can view all orders" do
  scenario "and see breakdown by status" do
    user  = User.create(username: "dude", password: "password")
    user2 = User.create(username: "JJ", password: "password")
    admin = User.create(username: "ash", password: "master_password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    brand = Brand.create(name: "Compaq")
    # category = Category.create(name: "Computers")
    product1 = Product.create(name: "prod1", description: "Awesome stuff", price: 500, brand_id: brand.id)
    product2 = Product.create(name: "prod2", description: "Also sick", price: 200, brand_id: brand.id)
    product3 = Product.create(name: "prod3", description: "basic", price: 20, brand_id: brand.id)

    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: user.id)
    order3 = Order.create(user_id: user2.id)

    visit admin_dashboard_path
    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
    expect(page).to have_content("Ordered")
    expect(page).to have_content("Paid")
    expect(page).to have_content("Cancelled")
    expect(page).to have_content("Completed")
  end

  scenario "and edit statuses" do

  end

end
