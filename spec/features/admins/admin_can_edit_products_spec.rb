require 'rails_helper'

RSpec.feature "Admin can edit existing products" do
  scenario "through the admin products page" do
    brand = Brand.create(name: "nokia")
    category = Category.create(name: "Education")
    product1 = Product.create(name: "Prod1", description: "awesome", price: 500, brand_id: brand.id, category_ids: category.id, image_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVnQ25wmlxtqiBHDhRR1uBSYZrUVp9wwBvVNdUx93ZHMiZ837-Ew")
    user = User.create(username: "michaelc", password: "words", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_products_path
    click_on "Edit"

    fill_in "product[name]", with: "product1edit"
    fill_in "product[description]", with: "sick product"
    fill_in "product[price]", with: 500
    select "nokia", from: "product_brand_id"
    check("Education")

    click_on "Update Product"

    expect(current_path).to eq(admin_products_path)
    expect(page).to have_content("product1edit")

  end
end
