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

ActiveRecord::Schema.define(version: 20140417213810) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_main"
    t.string   "slug"
    t.string   "super_category"
    t.boolean  "is_active"
    t.string   "meta_title"
    t.string   "meta_desc"
    t.string   "alt_tag"
    t.text     "description"
    t.integer  "main_category_id"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug"

  create_table "category_mats", force: true do |t|
    t.integer  "mat_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_photos", force: true do |t|
    t.integer  "category_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frames", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "photo_id"
    t.integer  "size_id"
    t.integer  "mat_id"
    t.boolean  "convert_to_bw", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "frame_id"
    t.integer  "qty",           default: 1,     null: false
  end

  add_index "line_items", ["frame_id"], name: "index_line_items_on_frame_id"
  add_index "line_items", ["mat_id"], name: "index_line_items_on_mat_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"
  add_index "line_items", ["photo_id"], name: "index_line_items_on_photo_id"
  add_index "line_items", ["size_id"], name: "index_line_items_on_size_id"

  create_table "main_categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "super_category"
    t.text     "description"
    t.boolean  "is_active"
    t.string   "meta_title"
    t.string   "meta_desc"
    t.string   "alt_tag"
  end

  create_table "mats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.boolean  "is_confirmed",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name_ship"
    t.string   "last_name_ship"
    t.string   "address1_ship"
    t.string   "address2_ship"
    t.string   "city_ship"
    t.string   "state_ship"
    t.string   "zipcode_ship"
    t.string   "first_name_bill"
    t.string   "last_name_bill"
    t.string   "address1_bill"
    t.string   "address2_bill"
    t.string   "city_bill"
    t.string   "state_bill"
    t.string   "zipcode_bill"
    t.string   "email"
    t.string   "confirm_email"
    t.string   "phone"
    t.string   "subtotal"
    t.string   "shipping"
    t.string   "tax"
    t.string   "grand_total"
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
    t.integer  "featured_gallery"
    t.string   "camera"
    t.string   "film_type"
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

  create_table "tiered_shippings", force: true do |t|
    t.decimal  "lower"
    t.decimal  "upper"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
