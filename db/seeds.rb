# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Creating Crusts
Crust.create(name: 'New hand tossed')
Crust.create(name: 'Wheat thin crust')
Crust.create(name: 'Cheese Burst')
Crust.create(name: 'Fresh pan pizza')

# Creating Vegetarian Toppings
Topping.create(name: 'Black olive', price: 20, vegetarian: true)
Topping.create(name: 'Capsicum', price: 25, vegetarian: true)
Topping.create(name: 'Paneer', price: 35, vegetarian: true)
Topping.create(name: 'Mushroom', price: 30, vegetarian: true)
Topping.create(name: 'Fresh tomato', price: 10, vegetarian: true)

# Creating Non-Vegetarian Toppings
Topping.create(name: 'Chicken tikka', price: 35, vegetarian: false)
Topping.create(name: 'Barbeque chicken', price: 45, vegetarian: false)
Topping.create(name: 'Grilled chicken', price: 40, vegetarian: false)
Topping.create(name: 'Extra cheese', price: 35, vegetarian: false)

# Creating Sides
Side.create(name: 'Cold drink', price: 55)
Side.create(name: 'Mousse cake', price: 90)

# Creating Vegetarian Pizzas
Pizza.create(name: 'Deluxe Veggie', vegetarian: true, regular_price: 150, medium_price: 200, large_price: 325)
Pizza.create(name: 'Cheese and corn', vegetarian: true, regular_price: 175, medium_price: 375, large_price: 475)
Pizza.create(name: 'Paneer Tikka', vegetarian: true, regular_price: 160, medium_price: 290, large_price: 340)

# Creating Non-Vegetarian Pizzas
Pizza.create(name: 'Non-Veg Supreme', vegetarian: false, regular_price: 190, medium_price: 325, large_price: 425)
Pizza.create(name: 'Chicken Tikka', vegetarian: false, regular_price: 210, medium_price: 370, large_price: 500)
Pizza.create(name: 'Pepper Barbecue Chicken', vegetarian: false, regular_price: 220, medium_price: 380, large_price: 525)

# Pizzas Inventory
Pizza.all.each do |pizza|
  Inventory.create(itemable: pizza, quantity: 100) # Assuming initial quantity of 100 for each pizza
end

# Crusts Inventory
Crust.all.each do |crust|
  Inventory.create(itemable: crust, quantity: 100) # Assuming initial quantity of 100 for each crust
end

# Toppings Inventory
Topping.all.each do |topping|
  Inventory.create(itemable: topping, quantity: 100) # Assuming initial quantity of 100 for each topping
end

# Sides Inventory
Side.all.each do |side|
  Inventory.create(itemable: side, quantity: 100) # Assuming initial quantity of 100 for each side
end



