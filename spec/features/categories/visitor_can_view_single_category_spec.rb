require 'rails_helper'

RSpec.feature "Anyone can see a category's show page" do
  scenario "and view the products under that category" do
    category           = Category.create(name: "TV")
    brand              = Brand.create(name: "Samsung")
    product_1          = Product.create(name: "4K", description: "high res", price: 1000,  brand_id: brand.id, category_ids: category.id)
    product_2          = Product.create(name: "OLED", description: "high res", price: 3300, brand_id: brand.id, category_ids: category.id)
    # product_category   = ProductCategory.create(category_id: category.id, product_id: product.id)


    visit ("/#{category.name}")

    expect(page).to have_content(category.name)
    expect(page).to have_content(product_1.name)
    expect(page).to have_content(product_2.name)
  end
end
