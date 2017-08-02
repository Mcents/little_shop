require 'rails_helper'

RSpec.feature "As an authenticated user" do
  scenario "I should see all orders belonging to me and click on an individual order" do
    user  = User.create(username: "dude", password: "password")

    brand = Brand.create(name: "Sony")

    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: user.id)

    product1 = Product.create!(name: "prod1", description: "Awesome stuff", price: 500, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/4544/4544340_sa.jpg", brand_id: brand.id)
    product2 = Product.create!(name: "prod2", description: "Also sick", price: 200, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/4544/4544340_sa.jpg", brand_id: brand.id)
    product3 = Product.find_by(name: "prod2")

    order1.products << product1
    order1.products << product2
    order1.products << product3

    visit root_path
    click_link "Login"
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Login"

    visit orders_path

    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)

    click_on(order1.id)

    expect(page).to have_content(order1.status)
    expect(page).to have_content(500)
    expect(order1.created_at.class).to eq(ActiveSupport::TimeWithZone)

  end

end

RSpec.feature  " If the order was completed or cancelled" do
  scenario "Then I should see a timestamp when the action took place" do
    user  = User.create(username: "dude", password: "password")

    brand = Brand.create(name: "Sony")

    order1 = Order.create(user_id: user.id, status: 3)
    order2 = Order.create(user_id: user.id)

    product1 = Product.create!(name: "prod1", description: "Awesome stuff", image_path: "https://img.bbystatic.com/BestBuy_US/images/products/4544/4544340_sa.jpg", price: 500, brand_id: brand.id)
    product2 = Product.create!(name: "prod2", description: "Also sick", image_path: "https://img.bbystatic.com/BestBuy_US/images/products/4544/4544340_sa.jpg", price: 200, brand_id: brand.id)
    product3 = Product.find_by(name: "prod2")

    order1.products << product1
    order1.products << product2
    order1.products << product3

    visit root_path
    click_link "Login"
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Login"

    visit orders_path

    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)

    click_on(order1.id)

    expect(page).to have_content(order1.status)
    expect(order1.status).to eq("completed")
    expect(page).to have_content("Updated at")
    expect(order1.updated_at.class).to eq(ActiveSupport::TimeWithZone)
  end
end
