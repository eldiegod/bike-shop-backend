# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_19_164556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_orders", force: :cascade do |t|
    t.bigint "bike_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_bike_orders_on_bike_id"
    t.index ["order_id"], name: "index_bike_orders_on_order_id"
  end

  create_table "bike_orders_customizable_options", id: false, force: :cascade do |t|
    t.bigint "bike_order_id", null: false
    t.bigint "customizable_option_id", null: false
    t.index ["bike_order_id", "customizable_option_id"], name: "index_bike_order_customizable_option"
    t.index ["customizable_option_id", "bike_order_id"], name: "index_customizable_option_bike_order"
  end

  create_table "bikes", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bikes_customizables", id: false, force: :cascade do |t|
    t.bigint "bike_id", null: false
    t.bigint "customizable_id", null: false
    t.index ["bike_id", "customizable_id"], name: "index_bikes_customizables_on_bike_id_and_customizable_id"
    t.index ["customizable_id", "bike_id"], name: "index_bikes_customizables_on_customizable_id_and_bike_id"
  end

  create_table "constrains", id: false, force: :cascade do |t|
    t.integer "customizable_option_id"
    t.integer "constrain_customizable_option_id"
    t.index ["constrain_customizable_option_id", "customizable_option_id"], name: "index_constrains_on_constrain_option_id_and_option_id", unique: true
    t.index ["customizable_option_id", "constrain_customizable_option_id"], name: "index_constrains_on_option_id_and_constrain_option_id", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customizable_options", force: :cascade do |t|
    t.string "name"
    t.bigint "customizable_id"
    t.float "price", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customizable_id"], name: "index_customizable_options_on_customizable_id"
  end

  create_table "customizables", force: :cascade do |t|
    t.string "name"
    t.boolean "hasColors", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float "total", default: 0.0
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

end
