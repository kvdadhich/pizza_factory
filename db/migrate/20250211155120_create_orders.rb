class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.string :status
      t.string :customer_name

      t.timestamps
    end
  end
end
