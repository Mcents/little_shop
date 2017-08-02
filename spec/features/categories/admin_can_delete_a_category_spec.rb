require 'rails_helper'

RSpec.feature "Admin can delete an existing category" do
  scenario "from the category database" do
    user = User.create(username: "mikey", password: "yeahyeah", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    category = Category.create(name: "Walkmans")

    visit ("/#{category.name}")

    expect(Category.count).to eq(1)
    expect(page).to have_content("Walkmans")
  save_and_open_page
    click_button "Delete"

    expect(current_path).to eq(categories_path)
    expect(Category.count).to eq(0)
  end
end
