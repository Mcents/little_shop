# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faraday'

class Seed
  def consume_api
    response = Faraday.get("https://api.bestbuy.com/v1/products((categoryPath.id=abcat0502000))?apiKey=U7szoI5Yfycb9uz165p2Y5oz&sort=name.asc&show=name,shortDescription,regularPrice,image,manufacturer,thumbnailImage,categoryPath.name&pageSize=1&format=json")
    raw_data = response.body
    @final_data = JSON.parse(raw_data)
  end

  def create_laptops
    @final_data["products"].each do |prod|
      current_product = Product.find_or_create_by!(name: prod["name"], description: prod["shortDescription"], price: prod["regularPrice"], image_path: prod["image"], brand_id: Brand.find_or_create_by!(name: prod["manufacturer"]).id)
      prod["categoryPath"].each{|cat| current_product.categories << Category.find_or_create_by(name: cat["name"])}
    end
  end
end
seed = Seed.new
seed.consume_api
seed.create_laptops
