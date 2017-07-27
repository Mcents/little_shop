require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  subject { ShoppingCart.new({"1" => 2, "2" => 3}) }

  describe "#total_count" do
    it "can calculate the total number of item it holds" do
      expect(subject.total_count).to eq(5)
    end
  end
  
end
