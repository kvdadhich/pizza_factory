FactoryBot.define do
  factory :inventory do
    association :itemable, factory: :topping
    association :itemable, factory: :pizza
    association :itemable, factory: :crust
    association :itemable, factory: :side
    quantity { 10 }
  end
end
