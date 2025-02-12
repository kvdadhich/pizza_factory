FactoryBot.define do
  factory :order_topping do
    association :order_item
    association :topping
  end
end
