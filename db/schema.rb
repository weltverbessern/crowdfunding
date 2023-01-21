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

ActiveRecord::Schema[7.0].define(version: 2023_01_20_201826) do
  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incentives", force: :cascade do |t|
    t.decimal "amount"
    t.string "amount_display"
    t.text "description"
    t.string "shipping_desc"
    t.string "delivery_desc"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: false, force: :cascade do |t|
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "uuid"
    t.string "user_id"
    t.decimal "price"
    t.string "phone"
    t.string "product_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "incentive_id"
    t.integer "order_number"
    t.string "payment_ref"
    t.string "first_name"
    t.string "last_name"
    t.string "payment_mode"
    t.string "payment_provider"
    t.string "payment_status"
  end

  create_table "translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.text "interpolations"
    t.boolean "is_proc", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
