require 'rails_helper'

RSpec.feature "Users cannot view other users' private data" do
  scenario "as authenticated users" do
    user = User.create!(username: "Timmy", password: "123")
    user2 = User.create!(username: "Jimmy", password: "123")

    brand = Brand.create!(name: "Sony")

    product1 = Product.create!(name: "prod1", description: "Awesome stuff", price: 500, brand_id: brand.id)
    product2 = Product.create!(name: "prod2", description: "Also sick", price: 200, brand_id: brand.id)
    product3 = Product.find_by(name: "prod2")

    order1 = Order.create!(user_id: user.id)
    order2 = Order.create!(user_id: user2.id)

    order1.products << [product1, product2, product3]

    order2.products << [product2, product3]


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    expect(page).to have_content("Welcome #{user.username}")

    visit user_path(user2)
    expect(page).to_not have_content("Welcome #{user2.username}")

    visit edit_user_path(user2)
    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit orders_path
    expect(page).to have_content(order1.id)
    expect(page).to_not have_content(order2.id)

    visit admin_dashboard_path
    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit admin_products_path
    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit edit_user_path(user)
    expect(page).to_not have_content("Role")
  end
end
