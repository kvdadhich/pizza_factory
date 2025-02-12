class Inventory < ApplicationRecord
  belongs_to :itemable, polymorphic: true

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.check_stock(itemable, required_quantity)
    inventory = find_by(itemable: itemable)
    return false if inventory.nil? || inventory.quantity < required_quantity
    true
  end

  def self.decrease_stock(itemable, quantity)
    inventory = find_by(itemable: itemable)
    return false unless inventory && inventory.quantity >= quantity

    inventory.update(quantity: inventory.quantity - quantity)
  end

  def self.restock(itemable, quantity)
    inventory = find_or_create_by(itemable: itemable)
    inventory.update(quantity: inventory.quantity + quantity)
  end
end
