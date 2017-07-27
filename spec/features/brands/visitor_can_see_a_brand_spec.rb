require 'rails_helper'

RSpec.feature "Anyone can see a brand's show page" do
  scenario "and view the brand's products" do
    brand = Brand.create(name: "Sony")
    product_1 = Product.create(name: "sweet TV", description: "really sweet", price: 500, brand_id: brand.id)
    product_2 = Product.create(name: "sweet keyboard", description: "really sweet keyboard", price: 5200, brand_id: brand.id)
    product_3 = Product.create(name: "sweet mouse", description: "really sweet mouse", price: 50, brand_id: brand.id)
    product_4 = Product.create(name: "sweet radio", description: "really sweet radio", price: 100, brand_id: brand.id)



    visit brand_path(brand)

    expect(page).to have_content("Sony")
    expect(page).to have_content(product_1.name)
    expect(page).to have_content(product_2.name)
    expect(page).to have_content(product_3.name)
    expect(page).to have_content(product_4.name)
  end

end
