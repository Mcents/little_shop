require 'rails_helper'

RSpec.feature "Admin can create products" do
  scenario "with valid attributes" do

    category = Category.create!(name: "laptops")
    category = Category.create!(name: "monitors")
    brand = Brand.create!(name: "samsung")

    visit new_product_path
    fill_in "product[name]", with: "product1"
    fill_in "product[description]", with: "sick product"
    fill_in "product[price]", with: 500
    select "samsung", from: "product_brand_id"

    check("laptops")
    check("monitors")

    click_on "Create Product"

    product = Product.last

    expect(current_path).to eq(products_path)
    expect(page).to have_content("product1")
    expect(page).to have_content("sick product")
    expect(page).to have_content(500)
  end
end
