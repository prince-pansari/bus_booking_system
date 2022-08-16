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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_045311) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string "bus_number"
    t.integer "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_number"], name: "index_buses_on_bus_number"
  end

  create_table "otp_verifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "otp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_otp_verifications_on_user_id"
  end

  create_table "route_stations", force: :cascade do |t|
    t.integer "route_id", null: false
    t.integer "station_id", null: false
    t.integer "station_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "route_name", null: false
    t.bigint "starting_station_id"
    t.bigint "ending_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ending_station_id"], name: "index_routes_on_ending_station_id"
    t.index ["starting_station_id"], name: "index_routes_on_starting_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bus_id", null: false
    t.integer "route_id", null: false
    t.integer "num_ticket", null: false
    t.integer "fare", null: false
    t.bigint "starting_station_id"
    t.bigint "ending_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ending_station_id"], name: "index_tickets_on_ending_station_id"
    t.index ["starting_station_id"], name: "index_tickets_on_starting_station_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.boolean "verified", default: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_users_on_number"
  end

  add_foreign_key "routes", "stations", column: "ending_station_id"
  add_foreign_key "routes", "stations", column: "starting_station_id"
  add_foreign_key "tickets", "stations", column: "ending_station_id"
  add_foreign_key "tickets", "stations", column: "starting_station_id"
end
