require 'rails_helper'

RSpec.feature "Guest can get appropriate search results" do
  before(:each) do
    @brand_1 = Brand.create!(name: "Sony")
    @brand_2 = Brand.create!(name: "Acer")
    @brand_3 = Brand.create!(name: "Phillips")
    @brand_4 = Brand.create!(name: "Apple")
    @brand_5 = Brand.create!(name: "Ryobi")

    @product_0 = Product.create!(name: "Headphones +1", description: "awesome and amazing better than Phillips", price: 200, brand_id: @brand_1.id, image_path: "bob")
    @product_1 = Product.create!(name: "Laptop", description: "awesome", price: 500, brand_id: @brand_2.id)
    @product_2 = Product.create!(name: "Phone", description: "awesome", price: 200, brand_id: @brand_1.id)
    @product_3 = Product.create!(name: "Aquos monitor", description: "awesome and amazing", price: 200, brand_id: @brand_4.id)
    @product_4 = Product.create!(name: "Stove", description: "awesome", price: 200, brand_id: @brand_5.id)
    @product_5 = Product.create!(name: "Headphones -2", description: "awesome and amazing not bluetooth compatible", price: 250, brand_id: @brand_2.id)
    @product_6 = Product.create!(name: "Headphones +4", description: "awesome and amazing", price: 200, brand_id: @brand_3.id)
    @product_7 = Product.create!(name: "Laptop 2", description: "amazing", price: 2000, brand_id: @brand_1.id)
    @product_8 = Product.create!(name: "Rusty rubber duck", description: "rusty", price: 400, brand_id: @brand_2.id)
    @product_9 = Product.create!(name: "headphones", description: "they have sound", price: 700, brand_id: @brand_2.id)
  end

  scenario "for Headphones" do
    visit root_path

    fill_in "query", with: "Headphones"
    page.all(:css, '.search-button')[0].click

    expect(current_path).to eq(products_path)
    expect(page).to have_content(@product_0.name)
    expect(page).to have_content(@product_5.name)
    expect(page).to have_content(@product_6.name)
    expect(page).to_not have_content(@product_7.name)

  end
end
