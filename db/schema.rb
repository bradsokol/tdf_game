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

ActiveRecord::Schema.define(version: 2019_12_27_222042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
