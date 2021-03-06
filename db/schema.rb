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

ActiveRecord::Schema.define(version: 20150725141422) do

  create_table "channel_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "cname"
    t.string   "menu"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "subtotal"
    t.decimal  "delivery"
    t.decimal  "tax"
    t.decimal  "total"
    t.string   "added_by"
    t.string   "channel_status"
    t.decimal  "bill"
    t.string   "delivery_place"
  end

  add_index "channels", ["user_id", "created_at"], name: "index_channels_on_user_id_and_created_at"
  add_index "channels", ["user_id"], name: "index_channels_on_user_id"

  create_table "deliveries", force: :cascade do |t|
    t.string   "place"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "cat"
    t.string   "subcat"
    t.string   "item_code"
    t.decimal  "price"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "meal"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.string   "cat"
    t.string   "subcat"
    t.string   "item_code"
  end

  add_index "orders", ["channel_id", "created_at"], name: "index_orders_on_channel_id_and_created_at"
  add_index "orders", ["channel_id"], name: "index_orders_on_channel_id"
  add_index "orders", ["created_at"], name: "index_orders_on_menu_item_id_and_created_at"
  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.string   "reset_sent_at"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
