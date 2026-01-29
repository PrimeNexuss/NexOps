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

ActiveRecord::Schema[8.1].define(version: 2026_01_27_111211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.date "end_date"
    t.string "name"
    t.bigint "operator_id", null: false
    t.date "start_date"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_campaigns_on_operator_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "operation_id"
    t.string "password_hash"
    t.text "source"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "evidences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "file_path"
    t.integer "finding_id"
    t.datetime "updated_at", null: false
  end

  create_table "findings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "operation_id"
    t.text "severity"
    t.integer "target_id"
    t.text "title"
    t.datetime "updated_at", null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "discovered_at"
    t.string "hostname"
    t.string "ip_address"
    t.text "notes"
    t.string "os"
    t.integer "state_compromise"
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_hosts_on_campaign_id"
  end

  create_table "operations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.text "name"
    t.text "scope"
    t.date "start_date"
    t.datetime "updated_at", null: false
  end

  create_table "operators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "generated_at"
    t.integer "operation_id"
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "host_name"
    t.integer "ip_address"
    t.integer "operation_id"
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.text "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.text "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.text "name"
    t.text "role"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "operators"
  add_foreign_key "hosts", "campaigns"
end
