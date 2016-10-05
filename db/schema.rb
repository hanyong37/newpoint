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

ActiveRecord::Schema.define(version: 20161004234411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lineitems", force: :cascade do |t|
    t.string   "product_id"
    t.integer  "amount"
    t.string   "order_id"
    t.decimal  "price",       precision: 10, scale: 2
    t.string   "description"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "user_id"
    t.date     "validate_from"
    t.date     "validate_to"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "address"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "member_id"
    t.string   "memo"
    t.string   "address"
    t.integer  "status"
    t.string   "feedback"
    t.integer  "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.decimal  "price"
    t.string   "photo"
    t.integer  "status"
    t.integer  "category_id"
    t.integer  "stock"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_admin"
    t.string   "mobile_number"
    t.string   "wx_code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
