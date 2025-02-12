# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_11_164740) do
  create_table "crusts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "itemable_type", null: false
    t.integer "itemable_id", null: false
    t.index ["itemable_type", "itemable_id"], name: "index_inventories_on_itemable"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "pizza_id", null: false
    t.integer "crust_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.index ["crust_id"], name: "index_order_items_on_crust_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["pizza_id"], name: "index_order_items_on_pizza_id"
  end

  create_table "order_sides", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "side_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_sides_on_order_id"
    t.index ["side_id"], name: "index_order_sides_on_side_id"
  end

  create_table "order_toppings", force: :cascade do |t|
    t.integer "order_item_id", null: false
    t.integer "topping_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_item_id"], name: "index_order_toppings_on_order_item_id"
    t.index ["topping_id"], name: "index_order_toppings_on_topping_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price"
    t.string "status"
    t.string "customer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.boolean "vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "regular_price"
    t.integer "medium_price"
    t.integer "large_price"
  end

  create_table "sides", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.boolean "vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_items", "crusts"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "pizzas"
  add_foreign_key "order_sides", "orders"
  add_foreign_key "order_sides", "sides"
  add_foreign_key "order_toppings", "order_items"
  add_foreign_key "order_toppings", "toppings"
end
