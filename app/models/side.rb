class Side < ApplicationRecord
  validates :name, :price, presence: true
  has_one :inventory, as: :itemable, dependent: :destroy
end
