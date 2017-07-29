class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  enum status: ["ordered", "paid", "cancelled", "completed"]
end
