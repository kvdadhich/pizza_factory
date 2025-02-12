class Crust < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :order_items
  has_one :inventory, as: :itemable, dependent: :destroy
end
