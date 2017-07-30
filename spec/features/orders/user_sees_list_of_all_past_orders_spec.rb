require 'rails_helper'

RSpec.feature "As an authenticated user" do
  scenario "I should see all orders belonging to me" do
    user  = User.create(username: "dude", password: "password")
    user2 = User.create(username: "JJ", password: "password")

    brand = Brand.create(name: "Sony")
    product1 = Product.create(name: "prod1", description: "Awesome stuff", price: 500, brand_id: brand.id)
    product2 = Product.create(name: "prod2", description: "Also sick", price: 200, brand_id: brand.id)
    product3 = Product.create(name: "prod3", description: "basic", price: 20, brand_id: brand.id)

    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: user.id)
    order3 = Order.create(user_id: user2.id)

    visit root_path
    click_link "Login"
    # page.all(:css, '.login-button-unique')[0].click
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Login"

    visit orders_path

    expect(page).to have_content(order1.id)
    expect(page).to have_content(order2.id)
    expect(page).to_not have_content(order3.id)
    # refactor get first user to logout and second user to login

    # click_on "Logout?"
    #
    #
    # visit root_path
    # click_link "Login"
    # # page.all(:css, '.login-button-unique')[0].click
    # fill_in "session[username]", with: user2.username
    # fill_in "session[password]", with: user2.password
    # click_button "Login"
    # save_and_open_page
    # expect(page).to_not have_content("prod1")
    # expect(page).to_not have_content("prod2")
    # expect(page).to have_content("prod3")
  end
end
