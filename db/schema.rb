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

ActiveRecord::Schema.define(version: 2020_07_25_060211) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.boolean "disabled", default: false, null: false

ActiveRecord::Schema.define(version: 2020_07_19_075338) do




ActiveRecord::Schema.define(version: 2020_07_19_052636) do

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "email"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.string "encrypted_password"
    t.boolean "status"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "orders", force: :cascade do |t|
    t.integer "member_id"
    t.integer "postage"
    t.integer "peyment_method"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  create_table "order_details", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "number"
    t.integer "taxed_price"
    t.integer "production_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id"

ActiveRecord::Schema.define(version: 2020_07_19_075338) do




ActiveRecord::Schema.define(version: 2020_07_19_052636) do

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "email"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.string "encrypted_password"
    t.boolean "status"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "order_details", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "number"
    t.integer "taxed_price"
    t.integer "production_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id"

    t.string "postal_code"
    t.string "address"
    t.string "address_name"
    t.integer "status"
    t.integer "postage"
    t.integer "payment_method"
    t.integer "total_amount"



ActiveRecord::Schema.define(version: 2020_07_19_075338) do


  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.boolean "disabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "post_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
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
    t.integer "genre_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer "member_id"
    t.string "post_code"
    t.string "address"
    t.string "address_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
