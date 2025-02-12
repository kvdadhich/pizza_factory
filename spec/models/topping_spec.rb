require 'rails_helper'

RSpec.describe Topping, type: :model do
  let(:topping) { create(:topping) }  

  it "validates presence of name" do
    topping.name = nil
    expect(topping).not_to be_valid
  end

  it "validates presence of price" do
    topping.price = nil
    expect(topping).not_to be_valid
  end
end
