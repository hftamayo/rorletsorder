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

ActiveRecord::Schema.define(version: 2022_06_03_174343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientaddresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "houseid"
    t.string "addcomplement"
    t.bigint "clients_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clients_id"], name: "index_clientaddresses_on_clients_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "itemamount"
    t.string "clientrequest"
    t.bigint "clients_id", null: false
    t.bigint "meals_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clients_id"], name: "index_orders_on_clients_id"
    t.index ["meals_id"], name: "index_orders_on_meals_id"
  end

  add_foreign_key "clientaddresses", "clients", column: "clients_id"
  add_foreign_key "orders", "clients", column: "clients_id"
  add_foreign_key "orders", "meals", column: "meals_id"
end
