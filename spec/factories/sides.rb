FactoryBot.define do
  factory :side do
    name { "Cold Drink" }
    price { 55 }

    after(:create) do |side|
      side.create_inventory(quantity: 10)
    end
  end
end
