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

ActiveRecord::Schema.define(version: 20170122165216) do

  create_table "comedies", force: :cascade do |t|
    t.string   "cz_title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "en_title"
  end

  create_table "comedy_comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "comedy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comedy_id"], name: "index_comedy_comments_on_comedy_id"
    t.index ["user_id"], name: "index_comedy_comments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.integer  "comedy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "alt"
    t.string   "image"
  end

  create_table "links", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "uri"
    t.integer  "linker_id"
    t.string   "linker_type"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login_token"
    t.datetime "login_token_valid_until"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.integer  "comedy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
