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

ActiveRecord::Schema.define(version: 20140720103706) do

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "medium"
    t.string   "author"
    t.integer  "date"
    t.string   "isbn"
    t.string   "location"
    t.string   "notes"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "editions"
    t.string   "tag"
    t.integer  "series_id"
    t.integer  "series_number"
  end

  add_index "items", ["author"], name: "index_items_on_author"
  add_index "items", ["date"], name: "index_items_on_date"
  add_index "items", ["isbn"], name: "index_items_on_isbn"
  add_index "items", ["medium"], name: "index_items_on_medium"
  add_index "items", ["status"], name: "index_items_on_status"
  add_index "items", ["title"], name: "index_items_on_title"

  create_table "series", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "withdrawals", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "edition"
  end

end
