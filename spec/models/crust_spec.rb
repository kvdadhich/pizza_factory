require 'rails_helper'

RSpec.describe Crust, type: :model do
  let(:crust) { create(:crust) }

  it "validates presence of name" do
    crust.name = nil
    expect(crust).not_to be_valid
  end
end
