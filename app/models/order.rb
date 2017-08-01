class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def quantity
    self.products.group(:product_id).count
  end

  def line_total
    @all_prices = self.products.uniq.map do |product|
      self.quantity[product.id] * product.price.to_f
    end
  end

  def total_price
    @all_prices.reduce(:+)
  end
end
