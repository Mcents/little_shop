require 'rails_helper'

RSpec.feature "User can view an individual product" do
  scenario "and see its attributes" do
    product1 = Product.create(name: "Prod1", description: "awesome", price: 500)

    visit product_path(product1)

    expect(page).to have_content(product1.name)
    expect(page).to have_content(product1.description)
    expect(page).to have_content(product1.price)

  end
end
