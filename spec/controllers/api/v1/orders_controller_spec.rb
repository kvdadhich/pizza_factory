require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  let!(:pizza) { create(:pizza) }
  let!(:crust) { create(:crust) }
  let!(:topping) { create(:topping) }
  let!(:side) { create(:side) }

  describe "POST #create" do
    it "creates a new order successfully" do
      post :create, params: {
        order: {
          status: "pending",
          customer_name: "Krishna",
          order_items_attributes: [{
            pizza_id: pizza.id,
            size: "Medium",
            crust_id: crust.id,
            order_toppings_attributes: [{ topping_id: topping.id }]
          }],
          order_sides_attributes: [{
            side_id: side.id
          }]
        }
      }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["message"]).to eq("Order placed successfully")
    end
  end
end
