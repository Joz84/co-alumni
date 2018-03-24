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

ActiveRecord::Schema.define(version: 20180324135155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_resources", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_mission_resources_on_mission_id"
    t.index ["resource_id"], name: "index_mission_resources_on_resource_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.integer "score"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "video_url"
    t.bigint "user_id"
    t.bigint "kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["kind_id"], name: "index_resources_on_kind_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "user_missions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mission_id"
    t.integer "status"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_user_missions_on_mission_id"
    t.index ["user_id"], name: "index_user_missions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.integer "score"
    t.string "country"
    t.string "token"
    t.integer "coordinator_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mission_resources", "missions"
  add_foreign_key "mission_resources", "resources"
  add_foreign_key "missions", "users"
  add_foreign_key "resources", "kinds"
  add_foreign_key "user_missions", "missions"
  add_foreign_key "user_missions", "users"
end
