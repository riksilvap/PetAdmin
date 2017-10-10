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

ActiveRecord::Schema.define(version: 20171010141717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "observations"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "title"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "price"
    t.text     "observations"
    t.integer  "supplier_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id", using: :btree
  end

  create_table "sells", force: :cascade do |t|
    t.decimal  "total"
    t.integer  "discount_id"
    t.integer  "client_id"
    t.text     "observations"
    t.integer  "status"
    t.date     "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["client_id"], name: "index_sells_on_client_id", using: :btree
    t.index ["discount_id"], name: "index_sells_on_discount_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.text     "observations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.text     "observations"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "products", "suppliers"
  add_foreign_key "sells", "clients"
  add_foreign_key "sells", "discounts"
end
