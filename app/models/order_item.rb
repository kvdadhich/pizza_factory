class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pizza
  belongs_to :crust
  has_many :order_toppings, dependent: :destroy

  accepts_nested_attributes_for :order_toppings, allow_destroy: true

  before_save :check_inventory
  before_save :enforce_business_rules

  def total_price
    pizza_price = pizza.price_for_size(size)
    topping_price = order_toppings.sum { |ot| ot.topping.price }
    topping_price = 0 if size == 'Large' && order_toppings.count <= 2
    
    pizza_price + topping_price
  end

  private

  def check_inventory
    raise "Insufficient stock for #{pizza.name}" unless Inventory.check_stock(pizza, 1)
    raise "Insufficient stock for #{crust.name}" unless Inventory.check_stock(crust, 1)
    order_toppings.each do |order_topping|
      raise "Insufficient stock for #{order_topping.topping.name}" unless Inventory.check_stock(order_topping.topping, 1)
    end

    # Decrease stock after successful order creation
    Inventory.decrease_stock(pizza, 1)
    Inventory.decrease_stock(crust, 1)
    order_toppings.each { |order_topping| Inventory.decrease_stock(order_topping.topping, 1) }
  end

  def enforce_business_rules
    if pizza.vegetarian? && order_toppings.any? { |t| !t.topping.vegetarian? }
      raise "Vegetarian pizzas cannot have non-veg toppings"
    end

    if !pizza.vegetarian? && order_toppings.any? { |t| t.topping.name == 'Paneer' }
      raise "Non-veg pizzas cannot have Paneer topping"
    end
  end
end
