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

ActiveRecord::Schema.define(version: 20170625103643) do

  create_table "article_catalogs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "remark",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "abstract",   limit: 65535
    t.text     "content",    limit: 65535
    t.boolean  "published",                default: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "catalog_id", limit: 4
  end

  add_index "articles", ["catalog_id"], name: "index_articles_on_catalog_id", using: :btree

  create_table "attachements", force: :cascade do |t|
    t.text     "description",     limit: 65535
    t.string   "file",            limit: 255
    t.integer  "attachable_id",   limit: 4
    t.string   "attachable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_name",       limit: 255
    t.integer  "hit",             limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           limit: 255, null: false
    t.string   "crypted_password",                limit: 255
    t.string   "salt",                            limit: 255
    t.string   "name",                            limit: 255
    t.string   "loginname",                       limit: 255
    t.string   "mobile",                          limit: 255
    t.string   "phone",                           limit: 255
    t.integer  "supplier_id",                     limit: 4
    t.integer  "department_id",                   limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "remember_me_token",               limit: 255
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token",            limit: 255
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
