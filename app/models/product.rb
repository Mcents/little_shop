class Product < ApplicationRecord

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :brand
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  
  enum role: %w(active retired)

  def self.search(query)
    if query
      where('name LIKE ?', "%#{query}%")
    else
      order('id DESC')
    end
  end
end
