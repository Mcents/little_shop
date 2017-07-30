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

  scenario "but cannot view retired button if item is active" do
    brand = Brand.create!(name: "ToysRus")
    product = Product.create!(name: "Magic Mirror", description: "Show gifs", brand: brand, price: 45.99, image_path: "http://www.murphysmagicmirror.co.uk/wp-content/uploads/2017/01/MagicMirror_15.jpg?gid=1", role: 0)

    visit product_path(product)

    expect(page).to have_button("Add Product")
    expect(page).to_not have_button("Item Retired")
  end

end
