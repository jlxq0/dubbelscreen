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

ActiveRecord::Schema.define(version: 20150923142355) do

  create_table "activitydata", force: :cascade do |t|
    t.integer  "person_id"
    t.date     "withings_taken_at"
    t.integer  "withings_steps"
    t.float    "withings_distance"
    t.float    "withings_calories"
    t.float    "withings_totalcalories"
    t.float    "withings_elevation"
    t.integer  "withings_soft"
    t.integer  "withings_moderate"
    t.integer  "withings_intense"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "activitydata", ["person_id"], name: "index_activitydata_on_person_id"

  create_table "dashboards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "long"
    t.integer  "woeid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id"

  create_table "news", force: :cascade do |t|
    t.integer  "newschannel_id"
    t.string   "title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "news", ["newschannel_id"], name: "index_news_on_newschannel_id"

  create_table "newschannels", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "feedurl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "newschannels", ["user_id"], name: "index_newschannels_on_user_id"

  create_table "people", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "fullname"
    t.date     "birthday"
    t.string   "withings_id"
    t.string   "withings_key"
    t.string   "withings_secret"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id"

  create_table "plexmedia", force: :cascade do |t|
    t.integer  "plexserver_id"
    t.string   "mediatype"
    t.string   "key"
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "plexmedia", ["plexserver_id"], name: "index_plexmedia_on_plexserver_id"

  create_table "plexservers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.integer  "port"
    t.string   "token"
    t.string   "shows_library"
    t.string   "movies_library"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "plexservers", ["user_id"], name: "index_plexservers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.boolean  "member"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weatherdata", force: :cascade do |t|
    t.integer  "location_id"
    t.date     "date"
    t.integer  "high"
    t.integer  "low"
    t.datetime "sunrise"
    t.datetime "sunset"
    t.string   "icon"
    t.string   "condition"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "weatherdata", ["location_id"], name: "index_weatherdata_on_location_id"

  create_table "weightdata", force: :cascade do |t|
    t.integer  "person_id"
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

  add_index "weightdata", ["person_id"], name: "index_weightdata_on_person_id"

end
