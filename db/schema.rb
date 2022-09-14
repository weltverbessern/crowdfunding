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

ActiveRecord::Schema[7.0].define(version: 2013_08_11_210951) do
  create_table "orders", id: false, force: :cascade do |t|
    t.string "token"
    t.string "transaction_id"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "status"
    t.string "number"
    t.string "uuid"
    t.string "user_id"
    t.decimal "price"
    t.decimal "shipping"
    t.string "tracking_number"
    t.string "phone"
    t.string "name"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_option_id"
    t.integer "order_number"
    t.string "stripe_customer_id"
  end

  create_table "payment_options", force: :cascade do |t|
    t.decimal "amount"
    t.string "amount_display"
    t.text "description"
    t.string "shipping_desc"
    t.string "delivery_desc"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
