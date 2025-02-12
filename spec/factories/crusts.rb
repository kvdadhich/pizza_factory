FactoryBot.define do
  factory :crust do
    name { "Cheese Burst" }

    after(:create) do |crust|
      crust.create_inventory(quantity: 10)
    end
  end
end
