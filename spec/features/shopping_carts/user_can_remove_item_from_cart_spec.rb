require 'rails_helper'

RSpec.feature "User can remove item from cart" do
  scenario "and its value is removed from total" do
  category = Category.create!(name: "Education")
  category2 = Category.create!(name: "Sickle")
  brand = Brand.create!(name: "Apple sickle")
 product = Product.create!(name: "Laptop", description: "It shows moving pictures", price: 5.00, category_ids: category.id, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

  visit products_path
  first(:button, "Add Product").click
  first(:button, "Add Product").click

  visit cart_path
  first(:button, "Remove").click

  expect(current_path).to eq(cart_path)
  expect(page).to have_content("Cart Total: 0")

  end
end
