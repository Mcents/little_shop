require 'rails_helper'

RSpec.feature "User can see retired products" do
  scenario "when a user visits a retired item's show page" do
    brand = Brand.create!(name: "ToysRus")
    product = Product.create!(name: "Magic Mirror", description: "Show gifs", brand: brand, price: 45.99, image_path: "http://www.murphysmagicmirror.co.uk/wp-content/uploads/2017/01/MagicMirror_15.jpg?gid=1", role: 1)

    visit product_path(product)

    expect(page).to_not have_content("Add Product")
    expect(page).to have_content("Item Retired")
  end
end
