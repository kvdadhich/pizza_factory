class CreateToppings < ActiveRecord::Migration[8.0]
  def change
    create_table :toppings do |t|
      t.string :name
      t.integer :price
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
