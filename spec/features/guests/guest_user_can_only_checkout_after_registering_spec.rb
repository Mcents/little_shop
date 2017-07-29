RSpec.feature "guest user" do
  scenario "I can only check out after I have logged in" do
    user = User.create(username: "usericus", password: "password")
    brand = Brand.create!(name: "Apple sickle")
    product_1 = Product.create!(id: 1, name: "Laptop1", description: "It shows moving pictures1", price: 5.00, category_ids: category.id, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)
    product_2 = Product.create!(id: 2,name: "Laptop2", description: "It shows moving pictures2", price: 15.00, category_ids: category.id, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)
    cart = ShoppingCart.new({"1" => 2, "2" => 3}

    visit

  end
end
