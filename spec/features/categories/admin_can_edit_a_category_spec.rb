require 'rails_helper'

RSpec.feature "Admin can edit an existing category" do
  scenario "in order to modify the details" do
    category = Category.create(name: "Tablets")

    visit edit_category_path(category)

    expect(page).to have_content("Tablets")
    expect(category.name).to eq("Tablets")

    fill_in "category[name]", with: "Wearables"
    click_on "Submit"

    expect(current_path).to eq("/Wearables")
    expect(page).to have_content("Wearables")
    expect(Category.find(category.id).name).to eq("Wearables")
    expect(page).to_not have_content("Tablets")
  end

  scenario "with invalid attributes" do
    category = Category.create(name: "Tablets")

    visit edit_category_path(category)

    expect(page).to have_content("Tablets")
    expect(category.name).to eq("Tablets")

    fill_in "category[name]", with: ""
    click_on "Submit"

    expect(current_path).to eq(edit_category_path(category))
  end
end
