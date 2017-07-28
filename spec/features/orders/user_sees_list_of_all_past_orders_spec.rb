require 'rails_helper'

RSpec.feature "As an authenticated user" do
  scenario "I should see all orders belonging to me" do
    user  = User.create(username: "dude", password: "password")

    brand = Brand.create(name: "Sony")
    product1 = Product.create(name: "prod1", description: "Awesome stuff", price: 500, brand_id: brand.id)
    product2 = Product.create(name: "prod2", description: "Also sick", price: 200, brand_id: brand.id)


    order1 = Order.create(product_id: product1.id, user_id: user.id)
    order2 = Order.create(product_id: product2.id, user_id: user.id)


    visit user_orders_path(user)

    expect(page).to have_content("prod1")
    expect(page).to have_content("prod2")
  end

  scenario "And no other orders" do

  end

end
