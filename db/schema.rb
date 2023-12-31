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

ActiveRecord::Schema[7.1].define(version: 2023_12_05_211009) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groupes", force: :cascade do |t|
    t.string "name", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groupes_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "resource_groupes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_resource_groupes_on_name", unique: true
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "referent_id", null: false
    t.bigint "groupe_id", null: false
    t.index ["groupe_id"], name: "index_resources_on_groupe_id"
    t.index ["name"], name: "index_resources_on_name", unique: true
    t.index ["referent_id"], name: "index_resources_on_referent_id"
    t.index ["service_id"], name: "index_resources_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.text "comment"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_services_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.bigint "groupe_id", null: false
    t.bigint "service_id", null: false
    t.string "phone_office"
    t.string "phone_home"
    t.boolean "manager", default: false, null: false
    t.boolean "inactive", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["groupe_id"], name: "index_users_on_groupe_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["service_id"], name: "index_users_on_service_id"
  end

  add_foreign_key "resources", "resource_groupes", column: "groupe_id"
  add_foreign_key "resources", "services"
  add_foreign_key "resources", "users", column: "referent_id"
  add_foreign_key "services", "locations"
  add_foreign_key "users", "groupes"
  add_foreign_key "users", "services"
end
