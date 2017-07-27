require 'rails_helper'

RSpec.feature "When a user clicks on the shopping cart" do
  before (:each) do
    @product = Product.create!(
    name: "Television",
    description: "It shows moving pictures",
    price: 5.00,
    image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg"
    )
  end

  scenario "they are taken to the cart path" do
    visit products_path
    first(:button, "Add Product").click
    click_link "Your Cart"

    expect(current_path).to eq("/cart")
    save_and_open_page

    expect(page).to have_content(@product.name)
    expect(page).to have_content(@product.description)
    expect(page).to have_css("img[src*='bbystatic']")


    expect(page).to have_content("Cart Total: 15.00")
  end
end
