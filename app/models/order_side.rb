class OrderSide < ApplicationRecord
  belongs_to :order
  belongs_to :side

  def side_price
    side.price
  end
end
