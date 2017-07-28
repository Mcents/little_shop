require 'rails_helper'

RSpec.feature "User can remove item from cart" do
  scenario "and its value is removed from total" do
    category = Category.create!(name: "Education")
    category2 = Category.create!(name: "Sickle")
    brand = Brand.create!(name: "Apple sickle")
    product = Product.create!(name: "Laptop1", description: "It shows moving pictures1", price: 5.00, category_ids: category.id, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)
    product2 = Product.create!(name: "Laptop2", description: "It shows moving pictures2", price: 15.00, category_ids: category.id, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    visit products_path
    page.all(:css, '.btn-success')[0].click
    page.all(:css, '.btn-success')[0].click
    page.all(:css, '.btn-success')[1].click

    visit cart_path

    expect(page).to have_content("Your Cart 3")
    expect(page).to have_content("Laptop1")
    expect(page).to have_content("Laptop2")

    first(:button, "Remove").click

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Your Cart 1")
    expect(page).to_not have_content("It shows moving pictures1")
    expect(page).to have_content("Laptop2")

    expect(page).to have_content("Successfully removed Laptop1 from your cart")

    click_link("Laptop1")
    expect(current_path).to eq("/products/#{product.id}")
  end
end
