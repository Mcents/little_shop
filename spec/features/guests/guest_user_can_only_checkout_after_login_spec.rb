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
    cart = ShoppingCart.new({"1" => 2, "2" => 3})

    visit cart_path

    expect(page).to_not have_content("Checkout")
    #refactor ^^ to look for css tag on checkout button
    #refactor vv to "Login or Create Account to Checkout"
    expect(page).to_not have_content("Login or Create Account to ")

    page.all(:css, '.login-navbar-unique')[0].click
    click_on "Create an Account"
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    visit cart_path

    expect(page).to have_content("laptop1")
    expect(page).to have_content("laptop2")
    expect(session[:cart][:contents]).to eq({"1" => 2, "2" => 3})
  end
end
