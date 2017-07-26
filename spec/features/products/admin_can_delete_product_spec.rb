require 'rails_helper'

RSpec.feature "Admin can delete an existing product" do
  scenario "and be redirected to the index" do
    product = Product.create(name: "thing", description: "sick bro", price: 500) 

    visit product_path(product)
    click_on "Delete"

    expect(page).to_not have_content(product.titel)
    expect(page).to_not have_content(product.description)
    expect(current_path).to eq(products_path)
  end
end
