class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def quantity
    self.products.inject(Hash.new(0)){|h, e| h[e] += 1; h}
  end

  # def line_total
  #   self.quantity[product] * prod
  # end

end
