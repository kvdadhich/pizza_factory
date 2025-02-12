class AddInventoryToModels < ActiveRecord::Migration[8.0]
  def change
    add_reference :inventories, :itemable, polymorphic: true, null: false
  end
end
