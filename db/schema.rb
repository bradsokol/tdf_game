# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_01_151405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "overall_results", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "tour_id"
    t.integer "overall_rank"
    t.integer "previous_rank"
    t.integer "points"
    t.integer "gap"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.integer "percentile"
    t.index ["player_id"], name: "index_overall_results_on_player_id"
    t.index ["tour_id"], name: "index_overall_results_on_tour_id"
  end

  create_table "player_rider_points", force: :cascade do |t|
    t.integer "points"
    t.bigint "tour_id"
    t.bigint "player_id"
    t.bigint "rider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "percentile", null: false
    t.integer "ordinal", null: false
    t.index ["player_id"], name: "index_player_rider_points_on_player_id"
    t.index ["rider_id"], name: "index_player_rider_points_on_rider_id"
    t.index ["tour_id"], name: "index_player_rider_points_on_tour_id"
  end

  create_table "player_rider_stage_points", force: :cascade do |t|
    t.integer "points"
    t.bigint "stage_id"
    t.bigint "player_id"
    t.bigint "rider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "percentile", null: false
    t.index ["player_id"], name: "index_player_rider_stage_points_on_player_id"
    t.index ["rider_id"], name: "index_player_rider_stage_points_on_rider_id"
    t.index ["stage_id"], name: "index_player_rider_stage_points_on_stage_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_registrations_on_player_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_riders_on_name"
  end

  create_table "riders_tours", id: false, force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.bigint "tour_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_riders_tours_on_tour_id"
  end

  create_table "stage_results", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "stage_id"
    t.integer "points"
    t.integer "overall_rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.datetime "results_downloaded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_stages_on_date"
    t.index ["tour_id"], name: "index_stages_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.integer "year"
    t.date "start_date"
    t.date "finish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year"], name: "index_tours_on_year"
  end

end
