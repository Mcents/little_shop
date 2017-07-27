require 'rails_helper'

RSpec.feature "A visitor can see list of all brands" do
  scenario "when browsing index page" do
    brand_1 = Brand.create(name: "Toshiba")
    brand_2 = Brand.create(name: "Mitsubishi")
    brand_3 = Brand.create(name: "Panasonic")

    visit brands_path

    expect(Brand.count).to eq(3)
    expect(page).to have_content("Toshiba")
    expect(page).to have_content("Mitsubishi")
    expect(page).to have_content("Panasonic")
  end
end
