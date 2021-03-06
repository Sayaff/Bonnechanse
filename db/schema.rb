# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171007174636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price_usd"
    t.decimal  "price_rub"
    t.string   "manufacturer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "admin_notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pattern_id"
    t.integer  "strand_id"
    t.integer  "fabric_id"
    t.integer  "kit_id"
    t.integer  "accessory_id"
    t.integer  "quantity"
    t.integer  "cart_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cart_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.decimal  "total_rub"
    t.decimal  "total_usd"
    t.integer  "user_id"
    t.string   "recipient_first_name"
    t.string   "recipient_middle_name"
    t.string   "recipient_last_name"
    t.string   "recipient_email"
    t.string   "recipient_address"
    t.integer  "cart_status_id"
    t.integer  "order_number"
    t.boolean  "for_yourself",          default: false
    t.boolean  "as_present",            default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "discount_amount"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "fabrics", force: :cascade do |t|
    t.string   "title"
    t.string   "manufacturer"
    t.string   "color"
    t.decimal  "price_usd"
    t.decimal  "price_rub"
    t.string   "size"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "kits", force: :cascade do |t|
    t.string   "title"
    t.string   "containment"
    t.decimal  "price_usd"
    t.decimal  "price_rub"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "status_id"
    t.integer  "user_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patterns", force: :cascade do |t|
    t.string   "title_en"
    t.string   "title_ru"
    t.text     "description_en"
    t.text     "description_ru"
    t.decimal  "price_usd"
    t.decimal  "price_rub"
    t.string   "designer"
    t.string   "size"
    t.string   "category"
    t.boolean  "discount_active",     default: false
    t.integer  "discount_percentage"
    t.date     "from_date"
    t.date     "to_date"
    t.decimal  "initial_price_rub"
    t.decimal  "initial_price_usd"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "strands", force: :cascade do |t|
    t.string   "title_en"
    t.string   "title_ru"
    t.string   "manufacturer"
    t.decimal  "price_usd"
    t.decimal  "price_rub"
    t.string   "color"
    t.string   "storage_status"
    t.integer  "storage_quantity"
    t.boolean  "discount_active",     default: false
    t.integer  "discount_percentage"
    t.date     "from_date"
    t.date     "to_date"
    t.decimal  "initial_price_rub"
    t.decimal  "initial_price_usd"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.text     "about"
    t.date     "birthday"
    t.string   "address"
    t.boolean  "admin",                  default: false
    t.boolean  "terms",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
