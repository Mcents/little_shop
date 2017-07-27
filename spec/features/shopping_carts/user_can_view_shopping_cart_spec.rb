require 'rails_helper'

RSpec.feature "When a user clicks on the shopping cart" do
  before (:each) do
    Product.create!(
    name: "Television",
    description: "It shows moving pictures",
    price: 5.00
    )
  end

  scenario "they are taken to the cart path" do
    visit products_path
    click_button "Add Product"
    click_link "Your Cart"

    expect(current_path).to eq("/cart")
    save_and_open_page
    expect(page).to have_content("Television")
  end
end
