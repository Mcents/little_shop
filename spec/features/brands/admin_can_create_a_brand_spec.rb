require 'rails_helper'

RSpec.feature "Admin can create brands" do
  scenario "create brands with valid attributes" do

    visit new_brand_path
    fill_in "brand[name]", with: "Zenith"
    click_on "Create Brand"

    brand = Brand.last

    expect(page).to have_content(brand.name)
  end

  scenario "not create a brand without valid attributes" do

    visit new_brand_path
    click_on "Create Brand"

    expect(current_path).to eq(new_brand_path)
  end
end
