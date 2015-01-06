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

ActiveRecord::Schema.define(version: 20150106101113) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "amount"
    t.string   "picture"
  end

  create_table "copies", force: true do |t|
    t.integer  "book_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ISBN"
    t.integer  "edition"
    t.integer  "year_of_print"
  end

  create_table "microposts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "possessions", force: true do |t|
    t.integer  "borrower_id"
    t.integer  "borrowed_id"
    t.string   "specifier",   default: "pending"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "possessions", ["borrowed_id"], name: "index_possessions_on_borrowed_id"
  add_index "possessions", ["borrower_id", "borrowed_id", "specifier"], name: "index_possessions_on_borrower_id_and_borrowed_id_and_specifier", unique: true
  add_index "possessions", ["borrower_id"], name: "index_possessions_on_borrower_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
