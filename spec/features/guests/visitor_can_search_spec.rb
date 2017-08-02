require 'rails_helper'

RSpec.feature "As a guest user" do
  scenario "I can enter text in the search bar and yield appropriat results" do
    category           = Category.create(name: "TV")
    brand              = Brand.create(name: "Samsung")
    product_1          = Product.create(name: "4K", description: "high res", price: 1000,  brand_id: brand.id, category_ids: category.id)
    product_2          = Product.create(name: "OLED", description: "high res", price: 3300, brand_id: brand.id, category_ids: category.id)

    visist root_path
    fill_in "search[keyword]", with "high res"
    click_on "Search"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("4k")
    expect(page).to have_content("OLED")
  end
end
