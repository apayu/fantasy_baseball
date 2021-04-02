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


ActiveRecord::Schema.define(version: 2021_04_01_163130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baseball_hitting_stats", force: :cascade do |t|
    t.integer "g"
    t.integer "ab"
    t.integer "r"
    t.integer "h"
    t.integer "d"
    t.integer "t"
    t.integer "hr"
    t.integer "rbi"
    t.integer "sb"
    t.integer "tb"
    t.integer "so"
    t.integer "bb"
    t.integer "lob"
    t.integer "xbh"
    t.integer "ao"
    t.integer "go"
    t.integer "gidp"
    t.integer "gidp_opp"
    t.integer "sf"
    t.integer "sac"
    t.integer "cs"
    t.integer "hbp"
    t.integer "ibb"
    t.integer "roe"
    t.integer "tpa"
    t.bigint "mlb_players_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mlb_players_id"], name: "index_baseball_hitting_stats_on_mlb_players_id"
  end

  create_table "baseball_pitching_stats", force: :cascade do |t|
    t.integer "g"
    t.integer "gs"
    t.float "ip"
    t.integer "r"
    t.integer "er"
    t.integer "hr"
    t.integer "bb"
    t.integer "so"
    t.integer "w"
    t.integer "l"
    t.integer "sv"
    t.integer "hld"
    t.integer "qs"
    t.integer "gidp"
    t.integer "gidp_opp"
    t.integer "hb"
    t.integer "ibb"
    t.bigint "mlb_players_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mlb_players_id"], name: "index_baseball_pitching_stats_on_mlb_players_id"
  end

  create_table "mlb_players", force: :cascade do |t|
    t.string "mlb_data_player_id", default: "", null: false
    t.string "name_display_first_last", default: "", null: false
    t.string "throws", default: "", null: false
    t.string "bats", default: "", null: false
    t.string "status", default: "", null: false
    t.string "primary_stat_type", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mlb_teams", force: :cascade do |t|
    t.string "city", default: "", null: false
    t.string "full_name", default: "", null: false
    t.string "tricode", default: "", null: false
    t.string "league_name", default: "", null: false
    t.string "div_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "baseball_hitting_stats", "mlb_players", column: "mlb_players_id"
  add_foreign_key "baseball_pitching_stats", "mlb_players", column: "mlb_players_id"
end
