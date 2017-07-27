require 'rails_helper'

RSpec.feature "User can view an individual product" do
  scenario "and see its attributes" do
    brand = Brand.create(name: "nokia")
    product1 = Product.create(name: "Prod1", description: "awesome", price: 500, brand_id: brand.id)

    visit product_path(product1)

    expect(page).to have_content(product1.name)
    expect(page).to have_content(product1.description)
    expect(page).to have_content(product1.price)

  end
end
