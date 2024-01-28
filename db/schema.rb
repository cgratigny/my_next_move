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

ActiveRecord::Schema[7.1].define(version: 2024_01_27_224224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "uri"
    t.string "timestamps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opportunity_count"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "daily_opportunity_stats", force: :cascade do |t|
    t.bigint "move_id"
    t.jsonb "data", default: {}
    t.date "date"
    t.jsonb "stats_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id", "date"], name: "index_daily_opportunity_stats_on_move_id_and_date", unique: true
    t.index ["move_id"], name: "index_daily_opportunity_stats_on_move_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.jsonb "data", default: {}
    t.string "file"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name"
    t.bigint "move_id"
    t.integer "position"
    t.integer "weight", default: 1
    t.jsonb "data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id"], name: "index_metrics_on_move_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "state"
    t.bigint "user_id"
    t.date "starts_on"
    t.date "stops_on"
    t.date "goal_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notes_count"
    t.integer "metrics_count"
    t.integer "metrics_total_weight"
    t.index ["user_id"], name: "index_moves_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "notable_type"
    t.bigint "notable_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source", default: "user"
    t.integer "version_id"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "name"
    t.string "uri"
    t.jsonb "data", default: {}
    t.string "state"
    t.string "rating"
    t.integer "pay_minimum"
    t.integer "pay_maximum"
    t.string "pay_period"
    t.bigint "company_id"
    t.date "applied_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notes_count"
    t.bigint "move_id"
    t.integer "tasks_count"
    t.string "tags"
    t.string "tags_string"
    t.boolean "metrics_enabled", default: false
    t.integer "total_score", default: 0
    t.integer "ranking", default: 0
    t.index ["company_id"], name: "index_opportunities_on_company_id"
    t.index ["move_id"], name: "index_opportunities_on_move_id"
  end

  create_table "opportunity_metrics", force: :cascade do |t|
    t.integer "score"
    t.bigint "opportunity_id"
    t.bigint "metric_id"
    t.jsonb "data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_opportunity_metrics_on_metric_id"
    t.index ["opportunity_id", "metric_id"], name: "index_opportunity_metrics_on_opportunity_id_and_metric_id", unique: true
    t.index ["opportunity_id"], name: "index_opportunity_metrics_on_opportunity_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "position"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tabular_data", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskable_type"
    t.bigint "taskable_id"
    t.date "due_date"
    t.string "name"
    t.string "body"
    t.string "state"
    t.text "description"
    t.jsonb "data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notes_count"
    t.index ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "data", default: {}
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "old_object"
    t.datetime "created_at"
    t.jsonb "object_changes"
    t.jsonb "object"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "taggings", "tags"
end
