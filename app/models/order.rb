class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def quantity
    self.products.group(:product_id).count
  end

  def line_total
    self.products.uniq.map do |product|
      self.quantity[product.id] * product.price.to_f
    end
  end

  def total_price
    self.quantity * self.line_total
  end

  # def line_total
  #   self.quantity[product] * prod
  # end
end
