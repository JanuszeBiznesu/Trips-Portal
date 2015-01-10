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

ActiveRecord::Schema.define(version: 20150109170654) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "amount"
    t.string   "picture"
    t.integer  "genre_id"
  end

  create_table "copies", force: true do |t|
    t.integer  "book_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ISBN"
    t.integer  "edition"
    t.integer  "year_of_print"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "pesel"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "activated",       default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
