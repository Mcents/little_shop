require 'rails_helper'

RSpec.feature "When a user adds products to their shopping cart" do
   scenario "a message pops up" do
    brand = Brand.create(name: "microsoft")
    product = Product.create!(name: "Laptop", description: "It shows moving pictures", price: 5.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    visit products_path
    first(:button, "Add Product").click
    expect(page).to have_content("1 Laptop in Cart")
    first(:button, "Add Product").click

    expect(page).to have_content("2 Laptops in Cart")
  end

  scenario "the total number of items in the cart increments" do
    brand = Brand.create(name: "microsoft")
    product = Product.create!(name: "Laptop", description: "It shows moving pictures", price: 5.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    visit products_path
    expect(page).to have_content("Your Cart 0")

    first(:button, "Add Product").click

    expect(page).to have_content("Your Cart 1")
    first(:button, "Add Product").click

    expect(page).to have_content("Your Cart 2")
  end

  scenario "from the product show page" do
    brand = Brand.create(name: "microsoft")
    product = Product.create!(name: "Laptop", description: "It shows moving pictures", price: 5.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    visit product_path(product)
    expect(page).to have_button "Add Product"

    first(:button, "Add Product").click
    expect(page).to have_content("1 Laptop in Cart")
  end
end
