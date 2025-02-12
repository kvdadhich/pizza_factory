require 'rails_helper'

RSpec.describe Pizza, type: :model do
  let(:pizza) { create(:pizza) }

  it "validates presence of name" do
    pizza.name = nil
    expect(pizza).not_to be_valid
  end

  it "fetches correct price for size" do
    expect(pizza.price_for_size("Regular")).to eq(150)
    expect(pizza.price_for_size("Medium")).to eq(200)
    expect(pizza.price_for_size("Large")).to eq(325)
  end
end