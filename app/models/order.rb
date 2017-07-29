class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  enum status: ["ordered", "paid", "cancelled", "completed"]
end
