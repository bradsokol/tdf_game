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

ActiveRecord::Schema[7.0].define(version: 2023_06_24_195331) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "overall_results", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "tour_id"
    t.integer "overall_rank"
    t.integer "previous_rank"
    t.integer "points"
    t.integer "gap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "percentile"
    t.index ["player_id"], name: "index_overall_results_on_player_id"
    t.index ["tour_id"], name: "index_overall_results_on_tour_id"
  end

  create_table "player_rider_points", force: :cascade do |t|
    t.integer "points"
    t.bigint "rider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ordinal", null: false
    t.bigint "overall_result_id", null: false
    t.index ["overall_result_id"], name: "index_player_rider_points_on_overall_result_id"
    t.index ["rider_id"], name: "index_player_rider_points_on_rider_id"
  end

  create_table "player_rider_stage_points", force: :cascade do |t|
    t.integer "points"
    t.bigint "rider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stage_result_id", null: false
    t.index ["rider_id"], name: "index_player_rider_stage_points_on_rider_id"
    t.index ["stage_result_id"], name: "index_player_rider_stage_points_on_stage_result_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_players_on_name", unique: true
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_registrations_on_player_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_riders_on_name"
  end

  create_table "riders_tours", id: false, force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.bigint "tour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_riders_tours_on_tour_id"
  end

  create_table "stage_results", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "stage_id"
    t.integer "points"
    t.integer "overall_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentile"
    t.index ["player_id"], name: "index_stage_results_on_player_id"
    t.index ["stage_id"], name: "index_stage_results_on_stage_id"
  end

  create_table "stages", force: :cascade do |t|
    t.bigint "tour_id"
    t.integer "number"
    t.date "date"
    t.string "start_town"
    t.string "start_country", default: "France"
    t.string "finish_town"
    t.string "finish_country", default: "France"
    t.integer "distance"
    t.string "stage_type"
    t.boolean "game_stage"
    t.datetime "results_downloaded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_stages_on_date"
    t.index ["tour_id", "number"], name: "index_stages_on_tour_id_and_number", unique: true
    t.index ["tour_id"], name: "index_stages_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.integer "year"
    t.date "start_date"
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year"], name: "index_tours_on_year", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
