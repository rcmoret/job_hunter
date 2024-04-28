# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_27_162220) do
  create_table "businesses", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "information", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["name", "user_id"], name: "index_businesses_on_name_and_user_id", unique: true
  end

  create_table "job_listing_event_types", force: :cascade do |t|
    t.string "description", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_job_listing_event_types_on_description"
  end

  create_table "job_listing_events", force: :cascade do |t|
    t.datetime "event_time", null: false
    t.integer "job_listing_event_type_id", null: false
    t.integer "job_listing_id", null: false
    t.string "info", limit: 5000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_listing_event_type_id"], name: "index_job_listing_events_on_job_listing_event_type_id"
    t.index ["job_listing_id"], name: "index_job_listing_events_on_job_listing_id"
  end

  create_table "job_listings", force: :cascade do |t|
    t.integer "business_id", null: false
    t.string "description", limit: 200, null: false
    t.string "point_of_contact", limit: 200, null: false
    t.string "url", limit: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deactivated_at"
    t.index ["business_id"], name: "index_job_listings_on_business_id"
  end

  create_table "user_configuration_options", force: :cascade do |t|
    t.string "description", limit: 200, null: false
    t.string "default_value", limit: 1000, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_configurations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "user_configuration_option_id", null: false
    t.string "value", limit: 1000, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_configuration_option_id"], name: "index_user_configurations_on_user_configuration_option_id"
    t.index ["user_id"], name: "index_user_configurations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "businesses", "users"
  add_foreign_key "job_listing_events", "job_listing_event_types"
  add_foreign_key "job_listing_events", "job_listings"
  add_foreign_key "job_listings", "businesses"
  add_foreign_key "user_configurations", "user_configuration_options"
  add_foreign_key "user_configurations", "users"
end
