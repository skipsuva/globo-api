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

ActiveRecord::Schema.define(version: 20160225151136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "pin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "next_id"
    t.boolean  "first"
  end

  add_index "destinations", ["first"], name: "index_destinations_on_first", using: :btree
  add_index "destinations", ["next_id"], name: "index_destinations_on_next_id", using: :btree
  add_index "destinations", ["pin_id"], name: "index_destinations_on_pin_id", using: :btree
  add_index "destinations", ["trip_id"], name: "index_destinations_on_trip_id", using: :btree

  create_table "pins", force: :cascade do |t|
    t.string   "nickname"
    t.datetime "start_date"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "visited",     default: true
  end

  add_index "pins", ["place_id"], name: "index_pins_on_place_id", using: :btree
  add_index "pins", ["user_id"], name: "index_pins_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "color"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "encrypted_password"
    t.string   "authentication_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "destinations", "pins"
  add_foreign_key "destinations", "trips"
  add_foreign_key "pins", "places"
  add_foreign_key "pins", "users"
  add_foreign_key "trips", "users"
end
