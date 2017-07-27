class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  belongs_to :brand 
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
