class CreatePizzas < ActiveRecord::Migration[8.0]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.integer :price
      t.string :size
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
