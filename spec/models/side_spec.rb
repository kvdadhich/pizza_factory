require 'rails_helper'

RSpec.describe Side, type: :model do

  let(:side) { create(:side) }

  it "validates presence of name" do
    side.name = nil
    expect(side).not_to be_valid
  end

  it "validates presence of price" do
    side.price = nil
    expect(side).not_to be_valid
  end
end
