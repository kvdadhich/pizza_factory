FactoryBot.define do
  factory :pizza do
    name { "Deluxe Veggie" }
    vegetarian { true }
    regular_price { 150 }
    medium_price { 200 }
    large_price { 325 }

    after(:create) do |pizza|
      pizza.create_inventory(quantity: 10)
    end
  end
end
