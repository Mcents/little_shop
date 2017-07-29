require 'rails_helper'

RSpec.feature "As an authenticated user" do
  scenario "I should see all orders belonging to me and click on an individual order" do
    user  = User.create(username: "dude", password: "password")

    brand = Brand.create(name: "Sony")
    product1 = Product.create(name: "prod1", description: "Awesome stuff", price: 500, brand_id: brand.id)
    product2 = Product.create(name: "prod2", description: "Also sick", price: 200, brand_id: brand.id)

    order1 = Order.create(product_id: product1.id, user_id: user.id)
    order2 = Order.create(product_id: product2.id, user_id: user.id)

    visit root_path
    click_link "Login"
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Login"

    visit orders_path

    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)

    click_link order1.id

    expect(page).to have_content("ordered")
    expect(page).to have_content(500)
    expect(order1.created_at).to eq(3/3/56)

  end
end
