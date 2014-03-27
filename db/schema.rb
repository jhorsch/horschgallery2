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

ActiveRecord::Schema.define(version: 20140326222440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_main"
    t.string   "main_category"
    t.string   "slug"
    t.string   "super_category"
    t.boolean  "is_active"
    t.string   "meta_title"
    t.string   "meta_desc"
    t.string   "alt_tag"
    t.text     "description"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "category_mats", force: true do |t|
    t.integer  "mat_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
    t.string   "id_num"
    t.string   "main_category"
    t.string   "sub_category"
    t.string   "artist_name"
    t.string   "year_taken"
    t.boolean  "is_active"
    t.boolean  "show_bw_conversion"
    t.integer  "format_id"
    t.string   "rotating_keyword"
    t.integer  "category_id"
  end

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.decimal  "product_weight"
    t.decimal  "box_weight"
    t.integer  "declared_value"
    t.integer  "price"
    t.integer  "format_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_ads_extension"
  end

end
