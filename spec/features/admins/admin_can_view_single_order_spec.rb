require 'rails_helper'

RSpec.feature "Admin can view a single order" do
  scenario "and see the order details" do

    brand = Brand.create(name: "Nike")
    category = Category.create(name: "laptops")
    pro_user = User.create!(username: "johnson", password: "tingy", role: 0)
    product = Product.create(name: "laptop1", description: "creay", price: 99, brand_id: brand.id, category_ids: category.id)
    order = Order.create!(user_id: pro_user.id, status: 0)
    order.products << product
    user = User.create(username: "mikey", password: "yeahyeah", role: 1)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit admin_dashboard_path
 save_and_open_page 
  expect(page).to have_content(order.id)

  click_on(order.id)

  expect(page).to have_content("Jim Johnson")
  expect(page).to have_link("laptop1")
  expect(page).to have_content(order.created_at)
  expect(page).to have_content("176 Alpine Trail"))
  end
end

