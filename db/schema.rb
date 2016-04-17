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

ActiveRecord::Schema.define(version: 20160417193732) do

  create_table "comedies", force: :cascade do |t|
    t.string   "cz_title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "en_title"
    t.string   "slug"
  end

  add_index "comedies", ["slug"], name: "index_comedies_on_slug", unique: true

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.integer  "comedy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "alt"
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
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
  add_index "taggings", ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.integer  "comedy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
