require 'rails_helper'

RSpec.feature "A visitor can see list of all categories" do
  scenario "when looking at index page" do
    category_1 = Category.create(name: "Toasters")
    category_2 = Category.create(name: "Computers")
    category_3 = Category.create(name: "Video Games")

    visit categories_path

    expect(Category.count).to eq(3)
    expect(page).to have_content("Toasters")
    expect(page).to have_content("Computers")
    expect(page).to have_content("Video Games")
  end
end
