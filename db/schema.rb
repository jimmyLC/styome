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

ActiveRecord::Schema.define(version: 20141118074941) do

  create_table "girl_productships", force: true do |t|
    t.integer  "girl_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "girls", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "images_file_name"
    t.string   "images_content_type"
    t.integer  "images_file_size"
    t.datetime "images_updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "quantity",    default: 0
    t.integer  "price",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
