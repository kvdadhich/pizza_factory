require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }

  it "validates presence of status" do
    order.status = nil
    expect(order).not_to be_valid
  end
end
