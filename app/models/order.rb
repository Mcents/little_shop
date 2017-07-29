class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product


  def display_orders_for_users

  end
end
