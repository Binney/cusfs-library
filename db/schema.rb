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

ActiveRecord::Schema.define(version: 20141208181938) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["name"], name: "index_authors_on_name"

  create_table "collections", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committees", force: true do |t|
    t.string   "date"
    t.integer  "start_year"
    t.string   "chairbeing"
    t.string   "secretary"
    t.string   "treasurer"
    t.string   "librarian"
    t.string   "memsec"
    t.string   "ttba"
    t.string   "reeve"
    t.string   "geldjarl"
    t.string   "runecaster"
    t.string   "meadkeeper"
    t.string   "bard"
    t.text     "vice_presidents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vp_election_method"
  end

  create_table "creations", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "medium"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "keywords"
    t.string   "image_url"
  end

  create_table "events", force: true do |t|
    t.datetime "time"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.datetime "end_time"
  end

  create_table "exhibits", force: true do |t|
    t.integer  "item_id"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "explanation"
  end

  add_index "exhibits", ["collection_id"], name: "index_exhibits_on_collection_id"
  add_index "exhibits", ["item_id", "collection_id"], name: "index_exhibits_on_item_id_and_collection_id", unique: true
  add_index "exhibits", ["item_id"], name: "index_exhibits_on_item_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "genres_items", id: false, force: true do |t|
    t.integer "genre_id"
    t.integer "item_id"
  end

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "medium"
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
    t.integer  "author_id"
    t.text     "description"
    t.string   "cover_url"
  end

  add_index "items", ["author_id"], name: "index_items_on_author_id"
  add_index "items", ["date"], name: "index_items_on_date"
  add_index "items", ["isbn"], name: "index_items_on_isbn"
  add_index "items", ["medium"], name: "index_items_on_medium"
  add_index "items", ["series_id"], name: "index_items_on_series_id"
  add_index "items", ["status"], name: "index_items_on_status"
  add_index "items", ["title"], name: "index_items_on_title"

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "notes"
    t.integer  "support"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.text     "notes"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "content_warnings"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "series_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id"
  add_index "reviews", ["item_id"], name: "index_reviews_on_item_id"
  add_index "reviews", ["series_id"], name: "index_reviews_on_series_id"

  create_table "series", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series", ["name"], name: "index_series_on_name"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  default: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "membership_expiry",      default: '3014-08-29 16:26:09'
    t.text     "about_me"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "withdrawals", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "edition"
  end

  add_index "withdrawals", ["item_id"], name: "index_withdrawals_on_item_id"
  add_index "withdrawals", ["user_id"], name: "index_withdrawals_on_user_id"

end
