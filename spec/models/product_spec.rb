require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should have_many(:product_categories) }
  it { should have_many(:categories).through(:product_categories) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }

end
