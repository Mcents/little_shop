require 'rails_helper'

RSpec.feature "Admin can create a product" do
  scenario "with valid attributes" do
  category = Category.create(name: "Education")
  brand = Brand.create(name: "Samsung")
  user = User.create(username: "michael", password: "thatsright", role: 1)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit new_admin_product_path

  fill_in :Name, with: "Product1"
  fill_in :Description, with: "So nice"
  fill_in :Price, with: 100
  fill_in "product[image_path]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVnQ25wmlxtqiBHDhRR1uBSYZrUVp9wwBvVNdUx93ZHMiZ837-Ew"
  select "Samsung", from: "product_brand_id"
  check("Education")
  click_on "Create Product"

  visit products_path
  expect(page).to have_content("Product1")


  end

  scenario "with invalid attributes" do
  category = Category.create(name: "Education")
  brand = Brand.create(name: "Samsung")
  user = User.create(username: "michael", password: "thatsright", role: 1)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit new_admin_product_path

  fill_in :Name, with: "Product1"
  fill_in :Description, with: "So nice"
  fill_in :Price, with: 0
  fill_in "product[image_path]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVnQ25wmlxtqiBHDhRR1uBSYZrUVp9wwBvVNdUx93ZHMiZ837-Ew"
  select "Samsung", from: "product_brand_id"
  check("Education")
  click_on "Create Product"

  expect(current_path).to eq(new_admin_product_path)
  end
end
