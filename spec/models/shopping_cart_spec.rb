require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  subject { ShoppingCart.new({"1" => 2, "2" => 3}) }

  describe "#total_count" do
    it "can calculate the total number of item it holds" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "#add_product" do
    it "adds a product to its contents" do
      subject.add_product(1)
      subject.add_product(2)

      expect(subject.contents).to eq({"1" => 3, "2" => 4})
    end
  end

  describe "#count_of" do
    it "reports how many of a particular item" do
      expect(subject.count_of(1)).to eq(2)
      expect(subject.count_of(2)).to eq(3)
    end
  end
end
