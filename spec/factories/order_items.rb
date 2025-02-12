FactoryBot.define do
  factory :order_item do
    association :order
    association :pizza
    association :crust
    size { "Medium" }
  end
end
