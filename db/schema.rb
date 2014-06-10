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

ActiveRecord::Schema.define(version: 20140610104509) do

  create_table "catalogs", force: true do |t|
    t.string   "catalog_id"
    t.string   "category"
    t.text     "description"
    t.text     "url"
    t.string   "rating"
    t.string   "youtube_url"
    t.string   "created_by"
    t.datetime "creation_date"
    t.string   "last_created_by"
    t.datetime "last_updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imap_dbs", force: true do |t|
    t.string   "ip"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imap_sessions", force: true do |t|
    t.string   "ip"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ip_addresses", force: true do |t|
    t.string   "ip",         null: false
    t.string   "catid"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
  end

end
