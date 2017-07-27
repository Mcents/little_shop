
require 'rails_helper'

RSpec.feature "Admin can edit an existing brand" do
  scenario "in order to modify details" do
    brand = Brand.create(name: "Sony")

    visit edit_brand_path(brand)

    expect(page).to have_content("Sony")
    expect(brand.name).to eq("Sony")

    fill_in "brand[name]", with: "Apple"
    click_on "Submit"

    expect(current_path).to eq(brand_path(brand))
    expect(page).to have_content("Apple")
    expect(Brand.find(brand.id).name).to eq("Apple")
    expect(page).to_not have_content("Sony")
  end
end
