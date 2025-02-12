require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:pizza) { create(:pizza) }
  let(:crust) { create(:crust) }
  let(:topping) { create(:topping) }
  let(:order) { create(:order) }

  it "calculates total price correctly" do
    order_item = create(:order_item, order: order, pizza: pizza, crust: crust)
    create(:order_topping, order_item: order_item, topping: topping)

    expected_price = pizza.medium_price + topping.price
    expect(order_item.reload.total_price).to eq(expected_price)
  end
end
