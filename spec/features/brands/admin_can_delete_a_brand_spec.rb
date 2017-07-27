require 'rails_helper'

RSpec.feature "Admin can delete an existing brand" do
  scenario "from the brand database" do
    brand = Brand.create(name: "Toshiba")
    visit brand_path(brand)

    expect(Brand.count).to eq(1)
    expect(page).to have_content("Toshiba")

    click_button "Delete"

    expect(current_path).to eq(brands_path)
    expect(Brand.count).to eq(0)
  end

end
