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

ActiveRecord::Schema.define(version: 2020_07_19_055113) do

  create_table "cart_products", force: :cascade do |t|
    t.integer "number"
    t.integer "member_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_cart_products_on_member_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.boolean "disabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "image_id"
    t.integer "salling_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer "member_id"
    t.string "post_code"
    t.string "adress"
    t.string "adress_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
