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

ActiveRecord::Schema.define(version: 20150424110751) do

  create_table "daytimes", force: :cascade do |t|
    t.string   "date"
    t.string   "time"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "daytimes", ["location_id"], name: "index_daytimes_on_location_id"

  create_table "dewpoints", force: :cascade do |t|
    t.decimal  "value"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "dewpoints", ["observation_id"], name: "index_dewpoints_on_observation_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "lat_long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string   "source"
    t.integer  "daytime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "observations", ["daytime_id"], name: "index_observations_on_daytime_id"

  create_table "rainfalls", force: :cascade do |t|
    t.decimal  "value"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "rainfalls", ["observation_id"], name: "index_rainfalls_on_observation_id"

  create_table "temperatures", force: :cascade do |t|
    t.decimal  "value"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "temperatures", ["observation_id"], name: "index_temperatures_on_observation_id"

  create_table "wind_directions", force: :cascade do |t|
    t.string   "value"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "wind_directions", ["observation_id"], name: "index_wind_directions_on_observation_id"

  create_table "wind_speeds", force: :cascade do |t|
    t.decimal  "value"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "wind_speeds", ["observation_id"], name: "index_wind_speeds_on_observation_id"

end
