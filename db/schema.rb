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

ActiveRecord::Schema[7.1].define(version: 2024_07_30_113449) do
  create_table "leases", force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "deposit_amount"
    t.integer "owner_id"
    t.integer "property_id"
    t.index ["owner_id"], name: "index_leases_on_owner_id"
    t.index ["property_id"], name: "index_leases_on_property_id"
    t.index ["tenant_id"], name: "index_leases_on_tenant_id"
    t.index ["unit_id"], name: "index_leases_on_unit_id"
  end

  create_table "maintenance_requests", force: :cascade do |t|
    t.integer "unit_id", null: false
    t.string "title"
    t.text "description"
    t.string "status"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.index ["tenant_id"], name: "index_maintenance_requests_on_tenant_id"
    t.index ["unit_id"], name: "index_maintenance_requests_on_unit_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "unit_type"
    t.decimal "rent_amount"
    t.integer "rooms"
    t.integer "bathrooms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_units_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
  end

  add_foreign_key "leases", "owners"
  add_foreign_key "leases", "properties"
  add_foreign_key "leases", "tenants"
  add_foreign_key "leases", "units"
  add_foreign_key "maintenance_requests", "tenants"
  add_foreign_key "maintenance_requests", "units"
  add_foreign_key "properties", "owners"
  add_foreign_key "units", "properties"
end
