require 'rails_helper'

RSpec.feature "Admin can create brands" do
  scenario "with valid attributes" do

    visit new_brand_path
    fill_in "brand[name]", with: "Zenith"
    click_on "Create Brand"

    brand = Brand.last

    expect(page).to have_content(brand.name)
  end
end
