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

ActiveRecord::Schema.define(version: 20140126092103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comedies", force: true do |t|
    t.string   "cz_title"
    t.text     "text"
    t.boolean  "publish"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "en_title"
  end

  create_table "images", force: true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "comedy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "alt"
    t.string   "caption"
  end

  create_table "links", force: true do |t|
    t.string   "href"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "comedy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wp_posts", id: false, force: true do |t|
    t.integer  "id",                    limit: 8, null: false
    t.integer  "post_author",           limit: 8
    t.datetime "post_date"
    t.datetime "post_date_gmt"
    t.text     "post_content"
    t.text     "post_title"
    t.text     "post_excerpt"
    t.text     "post_status"
    t.text     "comment_status"
    t.text     "ping_status"
    t.text     "post_password"
    t.text     "post_name"
    t.text     "to_ping"
    t.text     "pinged"
    t.datetime "post_modified"
    t.datetime "post_modified_gmt"
    t.text     "post_content_filtered"
    t.integer  "post_parent",           limit: 8
    t.text     "guid"
    t.integer  "menu_order"
    t.text     "post_type"
    t.text     "post_mime_type"
    t.integer  "comment_count",         limit: 8
  end

end
