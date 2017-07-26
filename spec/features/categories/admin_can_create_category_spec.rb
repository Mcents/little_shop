require 'rails_helper'

RSpec.feature "Admin can create a category" do
  scenario "with valid attributes" do
  
  visit new_category_path
  fill_in "category[name]", with: "cpu"
  click_on "Create Category"
  
  category = Category.last

  expect(page).to have_content(category.name)

  end
end
