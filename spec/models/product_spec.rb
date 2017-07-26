require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:product_categories) }
  it { should have_many(:categories).through(:product_categories) }
end
