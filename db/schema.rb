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

ActiveRecord::Schema.define(version: 20150214083448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "state"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "state"
    t.jsonb    "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "menu_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "page_type"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "file"
    t.hstore   "modification"
    t.string   "resource_token"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "photos", ["imageable_id", "imageable_type"], name: "index_photos_on_imageable_id_and_imageable_type", using: :btree
  add_index "photos", ["resource_token"], name: "index_photos_on_resource_token", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "sku"
    t.string   "hashid"
    t.integer  "position"
    t.string   "state"
    t.jsonb    "content"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "catalog_id"
    t.jsonb    "price"
  end

  create_table "top_menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "menu_categories", "categories"
  add_foreign_key "products", "catalogs"
  add_foreign_key "products", "categories"
  add_foreign_key "top_menus", "pages"
end
