class Topping < ApplicationRecord
  has_one :inventory, as: :itemable, dependent: :destroy
  has_many :order_toppings
  # has_many :order_items, through: :order_toppings

  validates :name, :price, presence: true
end
