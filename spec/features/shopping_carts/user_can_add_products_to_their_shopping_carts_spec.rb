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

    expect(page).to have_content("1 Television in Cart")
  end

  scenario "the message updates cart amount" do
    visit products_path
    click_button "Add Product"
    expect(page).to have_content("1 Television in Cart")
    click_button "Add Product"

    expect(page).to have_content("2 Televisions in Cart")
  end

  scenario "the total number of items in the cart increments" do
    visit products_path
    expect(page).to have_content("Your Cart 0")
    click_button "Add Product"

    expect(page).to have_content("Your Cart 1")
    click_button "Add Product"

    expect(page).to have_content("Your Cart 2")
  end
end
