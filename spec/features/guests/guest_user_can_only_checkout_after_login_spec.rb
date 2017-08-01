require 'rails_helper'

RSpec.feature "As a guest user" do
  scenario "I can only check out after I have created an account" do

    user_attributes = {
      username: "usericus",
      password: "password"
      }
    brand = Brand.create!(name: "Apple sickle")
    product_1 = Product.create!(id: 1, name: "Laptop1", description: "It shows moving pictures1", price: 5.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)
    product_2 = Product.create!(id: 2,name: "Laptop2", description: "It shows moving pictures2", price: 15.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    visit product_path(product_1)
    click_button("Add Product")
    click_on("Your Cart")

    expect(current_path).to eq("/cart")


    expect(page).to_not have_css('current_user_accessible')
    expect(page).to have_content("Login")

    page.all(:css, '.login-navbar-unique')[0].click

    click_on "Create an Account"

    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[confirm_password]", with: user_attributes[:password]
    click_on "Create Account"

    visit cart_path

    expect(page).to have_content("Laptop1")
    expect(page).to_not have_content("Laptop2")
    expect(page).to have_content("Your Cart 1")
  end
end
