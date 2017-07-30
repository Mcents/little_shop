require 'rails_helper'

RSpec.feature "Admin can view all items" do
  scenario "after clicking a link form the admin dashboard" do
  brand = Brand.create(name: "nokia")
  category = Category.create(name: "Education")
  product1 = Product.create(name: "Prod1", description: "awesome", price: 500, brand_id: brand.id, category_ids: category.id, image_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVnQ25wmlxtqiBHDhRR1uBSYZrUVp9wwBvVNdUx93ZHMiZ837-Ew")
  user = User.create(username: "michaelc", password: "words", role: 1)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit admin_dashboard_path
  click_on "Products"

  expect(page).to have_content(product1.image_path)
  expect(page).to have_link(product1.name)
  expect(page).to have_content(product1.description)
  end
end
