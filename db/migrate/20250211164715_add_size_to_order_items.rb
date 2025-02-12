class AddSizeToOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items, :size, :string
  end
end
