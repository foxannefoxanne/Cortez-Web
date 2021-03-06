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

ActiveRecord::Schema.define(version: 20160328005435) do

  create_table "audios", force: :cascade do |t|
    t.integer  "pin_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "aud_clip_file_name"
    t.string   "aud_clip_content_type"
    t.integer  "aud_clip_file_size"
    t.datetime "aud_clip_updated_at"
  end

  create_table "maps", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "pin_id"
  end

  create_table "pins", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "map_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "info"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",               default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "videos", force: :cascade do |t|
    t.integer  "pin_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "vid_clip_file_name"
    t.string   "vid_clip_content_type"
    t.integer  "vid_clip_file_size"
    t.datetime "vid_clip_updated_at"
  end

end
