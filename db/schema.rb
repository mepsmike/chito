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

ActiveRecord::Schema.define(version: 20150727114248) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "restaurant_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "status",        limit: 255, default: "waiting"
  end

  add_index "favorites", ["restaurant_id"], name: "index_favorites_on_restaurant_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "mrt_restaurantships", force: :cascade do |t|
    t.integer  "mrt_id",        limit: 4
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "mrt_restaurantships", ["mrt_id"], name: "index_mrt_restaurantships_on_mrt_id", using: :btree
  add_index "mrt_restaurantships", ["restaurant_id"], name: "index_mrt_restaurantships_on_restaurant_id", using: :btree

  create_table "mrts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "line_no",    limit: 4
    t.string   "line",       limit: 255
    t.decimal  "latitude",                 precision: 20, scale: 10
    t.decimal  "longitude",                precision: 20, scale: 10
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.text     "address",    limit: 65535
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "tel",                limit: 255
    t.text     "address",            limit: 65535
    t.decimal  "latitude",                         precision: 20, scale: 10
    t.decimal  "longitude",                        precision: 20, scale: 10
    t.string   "time",               limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "category_id",        limit: 4
    t.string   "yelp_restaurant_id", limit: 255
    t.string   "image_url",          limit: 255
  end

  add_index "restaurants", ["category_id"], name: "index_restaurants_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                limit: 255
    t.string   "first_name",           limit: 255
    t.string   "last_name",            limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "fb_uid",               limit: 255
    t.string   "image",                limit: 255
    t.string   "name",                 limit: 255
    t.string   "fb_token",             limit: 255
    t.datetime "fb_expires_at"
    t.string   "authentication_token", limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree

end
