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

ActiveRecord::Schema.define(version: 20180330210440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_addresses_on_name", unique: true
  end

  create_table "characteristic_values", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "part_of_characteristic_id", null: false
    t.bigint "connection_id", null: false
    t.bigint "person_id", null: false
    t.datetime "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_characteristic_values_on_connection_id"
    t.index ["part_of_characteristic_id"], name: "index_characteristic_values_on_part_of_characteristic_id"
    t.index ["person_id"], name: "index_characteristic_values_on_person_id"
  end

  create_table "characteristics", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "information_system_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_characteristics_on_address_id"
    t.index ["information_system_id"], name: "index_characteristics_on_information_system_id"
  end

  create_table "components", force: :cascade do |t|
    t.bigint "characteristic_id"
    t.bigint "part_of_characteristics_id"
    t.integer "sampling_step"
    t.integer "pid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characteristic_id"], name: "index_components_on_characteristic_id"
    t.index ["part_of_characteristics_id"], name: "index_components_on_part_of_characteristics_id"
  end

  create_table "connections", force: :cascade do |t|
    t.string "calculated_field", null: false
    t.integer "operation", null: false
    t.bigint "characteristic_id", null: false
    t.integer "employ", null: false
    t.time "ctime", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characteristic_id"], name: "index_connections_on_characteristic_id"
  end

  create_table "information_systems", force: :cascade do |t|
    t.string "name", null: false
    t.integer "dis_time"
    t.string "timezone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_information_systems_on_name", unique: true
  end

  create_table "part_of_characteristics", force: :cascade do |t|
    t.string "partname", null: false
    t.bigint "characteristic_id"
    t.integer "isweight", default: 1, null: false
    t.integer "type_of_data", null: false
    t.integer "result_type", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characteristic_id"], name: "index_part_of_characteristics_on_characteristic_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_people_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "info"
    t.text "full_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "weights", force: :cascade do |t|
    t.string "name", null: false
    t.integer "weight"
    t.bigint "part_of_characteristic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_of_characteristic_id"], name: "index_weights_on_part_of_characteristic_id"
  end

  add_foreign_key "characteristic_values", "connections"
  add_foreign_key "characteristic_values", "part_of_characteristics"
  add_foreign_key "characteristic_values", "people"
  add_foreign_key "characteristics", "addresses"
  add_foreign_key "characteristics", "information_systems"
  add_foreign_key "components", "characteristics"
  add_foreign_key "components", "part_of_characteristics", column: "part_of_characteristics_id"
  add_foreign_key "connections", "characteristics"
  add_foreign_key "part_of_characteristics", "characteristics"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
  add_foreign_key "weights", "part_of_characteristics"
end
