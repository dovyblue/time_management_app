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

ActiveRecord::Schema.define(version: 20170524204221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icon"
  end

  create_table "days", force: :cascade do |t|
    t.string   "date"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "task_to_dos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "day_id"
    t.integer  "task_id"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "importance"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "custom_duration"
    t.string   "departure"
    t.string   "destination"
    t.string   "drive_mode"
    t.integer  "going_time"
    t.integer  "coming_time"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "length_time"
    t.text     "notes"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "icon"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.string   "default_start_time"
    t.string   "default_end_time"
    t.string   "speed"
    t.integer  "time_between"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "home"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
