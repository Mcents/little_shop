require 'rails_helper'

RSpec.feature "When a user adds products to their shopping cart" do
  before (:each) do
    Product.create!(
    name: "Television",
    description: "It shows moving pictures",
    price: 5.00
    )
  end

  scenario "a message pops up" do
    visit products_path
    click_button "Add Product"

    expect(page).to have_content("1 Television added.")
  end

end
