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

ActiveRecord::Schema.define(version: 20160308122340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documentation_pages", force: :cascade do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.text     "compiled_content"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documentation_screenshots", force: :cascade do |t|
    t.string "alt_text"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.date     "birthday_date"
    t.text     "health_comment"
    t.integer  "admin_status"
    t.boolean  "complete_information", default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "research_name"
    t.string   "email"
    t.string   "access_token"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "emission_date"
    t.date     "begin_date"
    t.date     "end_date"
    t.float    "amount_ht"
    t.float    "amount_ttc"
    t.boolean  "paid_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "legal_informations", force: :cascade do |t|
    t.string   "name"
    t.text     "short_description"
    t.text     "content"
    t.datetime "publication_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "nifty_attachments", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.string   "token"
    t.string   "digest"
    t.string   "role"
    t.string   "file_name"
    t.string   "file_type"
    t.binary   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.float    "month_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packagings", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "user_id"
    t.float    "refund_percent"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "packagings", ["package_id"], name: "index_packagings_on_package_id", using: :btree
  add_index "packagings", ["user_id"], name: "index_packagings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "company_name"
    t.string   "company_domain"
    t.string   "company_address"
    t.string   "company_phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "employees", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "packagings", "packages"
  add_foreign_key "packagings", "users"
end
