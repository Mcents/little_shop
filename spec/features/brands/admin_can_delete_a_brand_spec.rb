
require 'rails_helper'

RSpec.feature "Admin can delete an existing brand" do
  scenario "from the brand database" do
    brand = Brand.create(name: "Toshiba")

    visit edit_brand_path(brand)

    expect(page).to have_content("Toshiba")

    click_on "Delete"

    expect(current_path).to eq()
  end

end
