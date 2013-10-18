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

ActiveRecord::Schema.define(version: 20131017143156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "categories", force: true do |t|
    t.string "name", null: false
  end

  create_table "machines", force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "name",                         null: false
    t.string   "location",                     null: false
    t.integer  "charge",                       null: false
    t.integer  "driver_charge"
    t.text     "description"
    t.hstore   "specification"
    t.boolean  "active",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machines", ["category_id"], name: "index_machines_on_category_id", using: :btree
  add_index "machines", ["user_id"], name: "index_machines_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",          null: false
    t.string   "phone",         null: false
    t.string   "password",      null: false
    t.datetime "sms_sended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree

end
