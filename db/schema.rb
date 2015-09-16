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

ActiveRecord::Schema.define(version: 20150915155654) do

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "fullname"
    t.date     "birthday"
    t.integer  "height"
    t.string   "withings_id"
    t.string   "withings_key"
    t.string   "withings_secret"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "weatherdata", force: :cascade do |t|
    t.decimal  "temperature"
    t.datetime "time"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "weatherdata", ["location_id"], name: "index_weatherdata_on_location_id"

  create_table "weightdata", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "withings_taken_at"
    t.integer  "withings_attribution"
    t.integer  "withings_category"
    t.float    "withings_weight"
    t.integer  "withings_size"
    t.float    "withings_fat"
    t.float    "withings_ratio"
    t.float    "withings_fat_free"
    t.float    "withings_diastolic_blood_pressure"
    t.float    "withings_systolic_blood_pressure"
    t.integer  "withings_heart_pulse"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "weightdata", ["user_id"], name: "index_weightdata_on_user_id"

end
