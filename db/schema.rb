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

ActiveRecord::Schema.define(version: 2022_03_31_043413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "subdomain"
    t.integer "owner_id"
    t.string "company_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "number_of_visits"
    t.datetime "last_visited_date"
    t.integer "customer_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "name_kana"
    t.string "postcode"
    t.string "prefecture"
    t.string "municipality"
    t.string "address"
    t.string "building_address"
    t.date "date_of_birth"
    t.integer "gender", default: 0
    t.string "email"
    t.string "remarks"
    t.string "company_name"
    t.index ["discarded_at"], name: "index_customers_on_discarded_at"
  end

  create_table "floors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "voucher_code"
    t.integer "number_of_guests"
    t.integer "reservation_state"
    t.integer "user_id"
    t.datetime "discarded_at"
    t.bigint "customer_id", null: false
    t.bigint "table_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["discarded_at"], name: "index_reservations_on_discarded_at"
    t.index ["table_id"], name: "index_reservations_on_table_id"
  end

  create_table "restaurant_settings", force: :cascade do |t|
    t.string "open_hours"
    t.string "close_hours"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_restaurant_settings_on_account_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.integer "customer_capacity"
    t.json "properties"
    t.integer "state", default: 0
    t.bigint "floor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.index ["floor_id"], name: "index_tables_on_floor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "tables"
  add_foreign_key "restaurant_settings", "accounts"
  add_foreign_key "tables", "floors"
end
