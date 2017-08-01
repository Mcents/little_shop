require 'rails_helper'

RSpec.feature "Admin can create a category" do
  scenario "with valid attributes" do


  visit new_category_path
  fill_in "category[name]", with: "cpuunit"
  click_on "Create Category"

  category = Category.last

  expect(current_path).to eq('/cpuunit')

  end

  scenario "with invalid attributes" do

    visit new_category_path
    click_on "Create Category"

    expect(current_path).to eq(new_category_path)
  end 
end
