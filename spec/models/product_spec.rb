require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should have_many(:product_categories) }
  it { should have_many(:categories).through(:product_categories) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }

  it "can be created with an active role" do
    brand = Brand.create!(name: "ToysRus")
    product = Product.create!(name: "Magic Mirror", description: "Show gifs", brand: brand, price: 45.99, image_path: "http://www.murphysmagicmirror.co.uk/wp-content/uploads/2017/01/MagicMirror_15.jpg?gid=1", role: 0)

    expect(product.role).to eq("active")
    expect(product.active?).to be_truthy
  end

  it "can be created with a retired role" do
    brand = Brand.create!(name: "ToysRus")
    product = Product.create!(name: "Magic Mirror", description: "Show gifs", brand: brand, price: 45.99, image_path: "http://www.murphysmagicmirror.co.uk/wp-content/uploads/2017/01/MagicMirror_15.jpg?gid=1", role: 1)

    expect(product.role).to eq("retired")
    expect(product.retired?).to be_truthy
  end

end
