require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:product_categories) }
  it { should have_many(:products).through(:product_categories) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

end
