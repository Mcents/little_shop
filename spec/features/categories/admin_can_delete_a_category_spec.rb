require 'rails_helper'

RSpec.feature "Admin can delete an existing category" do
  scenario "from the category database" do
    category = Category.create(name: "Walkmans")

    visit ("/#{category.name}")

    expect(Category.count).to eq(1)
    expect(page).to have_content("Walkmans")

    click_button "Delete"

    expect(current_path).to eq(categories_path)
    expect(Category.count).to eq(0)
  end
end
