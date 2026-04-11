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

ActiveRecord::Schema[8.1].define(version: 2026_04_11_195315) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.text "details"
    t.string "ip_address"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

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
    t.string "default"
    t.text "description"
    t.string "false"
    t.integer "operation_id"
    t.text "severity"
    t.integer "target_id"
    t.text "title"
    t.datetime "updated_at", null: false
    t.boolean "verified"
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

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "message"
    t.string "notification_type"
    t.boolean "read"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "operations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.text "name"
    t.text "scope"
    t.date "start_date"
    t.string "status", default: "active"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_operations_on_user_id"
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

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.text "permissions"
    t.datetime "updated_at", null: false
  end

  create_table "search_queries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "filters"
    t.string "query"
    t.string "search_type"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_search_queries_on_user_id"
  end

  create_table "targets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "default"
    t.string "false"
    t.string "host_name"
    t.string "ip_address"
    t.integer "operation_id"
    t.string "os"
    t.boolean "state_compromise"
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.text "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.text "name"
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "role_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.text "name"
    t.boolean "newsletter_subscribed", default: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.text "role"
    t.boolean "terms_accepted", default: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audit_logs", "users"
  add_foreign_key "campaigns", "operators"
  add_foreign_key "credentials", "operations"
  add_foreign_key "evidences", "findings"
  add_foreign_key "findings", "operations"
  add_foreign_key "findings", "targets"
  add_foreign_key "hosts", "campaigns"
  add_foreign_key "notifications", "users"
  add_foreign_key "operations", "users"
  add_foreign_key "reports", "operations"
  add_foreign_key "search_queries", "users"
  add_foreign_key "targets", "operations"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
