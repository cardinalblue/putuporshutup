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

ActiveRecord::Schema.define(version: 20190503043608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "map_url"
    t.float "price_per_person"
    t.boolean "refundable"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "deadline"
    t.bigint "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "itinerary_id"
    t.index ["host_id"], name: "index_events_on_host_id"
    t.index ["itinerary_id"], name: "index_events_on_itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "organizer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_itineraries_on_organizer_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "attendee_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_reservations_on_attendee_id"
    t.index ["event_id"], name: "index_reservations_on_event_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "attendee_id"
    t.integer "status_after"
    t.integer "status_before"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_transactions_on_attendee_id"
    t.index ["event_id"], name: "index_transactions_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "account"
    t.string "password"
    t.string "payment_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
