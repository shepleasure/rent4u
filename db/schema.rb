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

ActiveRecord::Schema.define(version: 20160529133406) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "listing_attachments", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "city"
    t.string   "locality"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "price"
    t.string   "time"
    t.string   "security"
    t.text     "terms"
    t.string   "delivery"
    t.string   "security_amount"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notified_by_id"
    t.integer  "listing_id"
    t.integer  "identifier"
    t.string   "notice_type"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "notifications", ["listing_id"], name: "index_notifications_on_listing_id"
  add_index "notifications", ["notified_by_id"], name: "index_notifications_on_notified_by_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "pin"
    t.boolean  "verified"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "listing_id"
  end

  add_index "phone_numbers", ["listing_id"], name: "index_phone_numbers_on_listing_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "listing_id"
    t.string   "title"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "fullname"
    t.string   "mobile_number"
    t.string   "verification_code"
    t.boolean  "is_verified"
    t.boolean  "guest",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
