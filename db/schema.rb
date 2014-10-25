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

ActiveRecord::Schema.define(version: 20141025213539) do

  create_table "direction_stops", force: true do |t|
    t.integer  "direction_id", null: false
    t.integer  "stop_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "direction_stops", ["direction_id"], name: "index_direction_stops_on_direction_id"
  add_index "direction_stops", ["stop_id"], name: "index_direction_stops_on_stop_id"

  create_table "directions", force: true do |t|
    t.string   "tag",        null: false
    t.string   "title",      null: false
    t.string   "name",       null: false
    t.integer  "route_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paths", force: true do |t|
    t.integer  "route_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.integer  "path_id"
    t.decimal  "lat",        precision: 10, scale: 6, null: false
    t.decimal  "lon",        precision: 10, scale: 6, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "tag",                                     null: false
    t.string   "title",                                   null: false
    t.string   "color",                                   null: false
    t.string   "opposite_color",                          null: false
    t.decimal  "lat_min",        precision: 10, scale: 6, null: false
    t.decimal  "lat_max",        precision: 10, scale: 6, null: false
    t.decimal  "lon_min",        precision: 10, scale: 6, null: false
    t.decimal  "lon_max",        precision: 10, scale: 6, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stops", force: true do |t|
    t.string   "tag",                                 null: false
    t.string   "title",                               null: false
    t.string   "stop_id",                             null: false
    t.decimal  "lat",        precision: 10, scale: 6, null: false
    t.decimal  "lon",        precision: 10, scale: 6, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
