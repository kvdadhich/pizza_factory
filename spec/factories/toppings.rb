FactoryBot.define do
  factory :topping do
    name { "Black Olive" }
    price { 20 }
    vegetarian { true }

    after(:create) do |topping|
      topping.create_inventory(quantity: 10)
    end
  end
end
