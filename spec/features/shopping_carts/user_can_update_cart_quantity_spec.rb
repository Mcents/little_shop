require 'rails_helper'

RSpec.feature "User can update cart quantity" do
  scenario "and sees the changed number in card" do
    category = Category.create!(name: "Education")
    category2 = Category.create!(name: "Sickle")
    brand = Brand.create!(name: "Apple sickle")
    product = Product.create!(name: "Laptop1", description: "It shows moving pictures1", price: 5.00, category_ids: category.id, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)


    visit products_path
    page.all(:css, '.btn-success')[0].click
    page.all(:css, '.btn-success')[0].click


    visit cart_path
    click_button('-')
    expect(page).to have_content("Your Cart 1") 
  end
end
