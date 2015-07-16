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

ActiveRecord::Schema.define(version: 20150716052143) do

  create_table "ameens_menus", force: :cascade do |t|
    t.string   "category"
    t.string   "subcat"
    t.string   "item_code"
    t.string   "name"
    t.decimal  "price"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ameens_menus", ["channel_id", "created_at"], name: "index_ameens_menus_on_channel_id_and_created_at"
  add_index "ameens_menus", ["channel_id"], name: "index_ameens_menus_on_channel_id"
  add_index "ameens_menus", ["user_id", "created_at"], name: "index_ameens_menus_on_user_id_and_created_at"
  add_index "ameens_menus", ["user_id"], name: "index_ameens_menus_on_user_id"

  create_table "channel_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "cname"
    t.string   "menu"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "channels", ["user_id"], name: "index_channels_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "item_code"
    t.string   "name"
    t.decimal  "price"
    t.string   "cat"
    t.string   "subcat"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "channel_id"
    t.integer  "user_id"
    t.decimal  "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["channel_id"], name: "index_order_items_on_channel_id"
  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id"
  add_index "order_items", ["user_id"], name: "index_order_items_on_user_id"

  create_table "orders", force: :cascade do |t|
    t.string   "meal"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["channel_id", "created_at"], name: "index_orders_on_channel_id_and_created_at"
  add_index "orders", ["channel_id"], name: "index_orders_on_channel_id"
  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
