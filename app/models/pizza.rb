class Pizza < ApplicationRecord
  has_many :order_items
  validates :name, presence: true
  validates :regular_price, :medium_price, :large_price, numericality: { greater_than: 0 }
  has_one :inventory, as: :itemable, dependent: :destroy

  def price_for_size(size)
    case size
    when 'Regular' then regular_price
    when 'Medium' then medium_price
    when 'Large' then large_price
    else raise "Invalid pizza size: #{size}"
    end
  end
end
