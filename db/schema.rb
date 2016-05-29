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

ActiveRecord::Schema.define(version: 20160529223854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_taggings", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "author_taggings", ["author_id"], name: "index_author_taggings_on_author_id", using: :btree
  add_index "author_taggings", ["tag_id"], name: "index_author_taggings_on_tag_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poem_taggings", force: :cascade do |t|
    t.integer  "poem_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "poem_taggings", ["poem_id"], name: "index_poem_taggings_on_poem_id", using: :btree
  add_index "poem_taggings", ["tag_id"], name: "index_poem_taggings_on_tag_id", using: :btree

  create_table "poems", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "metaphor"
    t.datetime "date"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "poems", ["author_id"], name: "index_poems_on_author_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "author_taggings", "authors"
  add_foreign_key "author_taggings", "tags"
  add_foreign_key "poem_taggings", "poems"
  add_foreign_key "poem_taggings", "tags"
  add_foreign_key "poems", "authors"
end
