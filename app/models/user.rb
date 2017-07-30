class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :order_products, through: :orders
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: %w(default admin)
end
