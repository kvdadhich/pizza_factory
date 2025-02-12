class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :order_sides, dependent: :destroy
  validates :status, inclusion: { in: %w[pending confirmed completed] }

  accepts_nested_attributes_for :order_items, allow_destroy: true
  accepts_nested_attributes_for :order_sides, allow_destroy: true

  before_create :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_items.sum(&:total_price) + order_sides.sum(&:side_price)
  end
end
