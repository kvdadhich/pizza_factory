class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.new(order_params)

    if order.save
      render json: { message: 'Order placed successfully', order: order }, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    order = Order.find(params[:id])
    render json: order, status: :ok
  end

  def restock
    item = find_item(params[:item_type], params[:item_id])
    if item
      Inventory.restock(item, params[:quantity].to_i)
      render json: { message: "#{params[:quantity]} units added to inventory for #{item.name}" }
    else
      render json: { error: "Invalid item type or ID" }, status: :not_found
    end
  end

  private

  def order_params
    params.require(:order).permit(:status, :customer_name, order_items_attributes: [:pizza_id, :size, :crust_id, order_toppings_attributes: [:topping_id]], order_sides_attributes: [:side_id])
  end

  def find_item(item_type, item_id)
    item_type.constantize.find_by(id: item_id)
  end
end
