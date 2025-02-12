require 'rails_helper'

RSpec.describe Inventory, type: :model do

  let(:pizza) { create(:pizza) }
  let(:inventory) { Inventory.create(itemable: pizza, quantity: 5) }

  it "checks stock availability" do
    expect(Inventory.check_stock(pizza, 3)).to be_truthy
    expect(Inventory.check_stock(pizza, 16)).to be_falsey
  end
end
