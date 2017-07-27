require 'rails_helper'

RSpec.feature "When a user clicks on the shopping cart" do 
  scenario "they are taken to the cart path" do
    brand = Brand.create(name: "apple")
    product = Product.create!( name: "Television", description: "It shows moving pictures", price: 5.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    
    visit products_path
    first(:button, "Add Product").click
    first(:button, "Add Product").click
    click_link "Your Cart"

    expect(current_path).to eq("/cart")

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_css("img[src*='bbystatic']")


    expect(page).to have_content("Cart Total: 10.0")
  end
end
