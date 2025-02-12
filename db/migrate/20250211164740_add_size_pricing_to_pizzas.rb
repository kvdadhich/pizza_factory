class AddSizePricingToPizzas < ActiveRecord::Migration[8.0]
  def change
    add_column :pizzas, :regular_price, :integer
    add_column :pizzas, :medium_price, :integer
    add_column :pizzas, :large_price, :integer
    remove_column :pizzas, :price, :integer
  end
end
