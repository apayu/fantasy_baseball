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

ActiveRecord::Schema.define(version: 2021_04_30_083943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baseball_hitting_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "g"
    t.integer "ab"
    t.integer "pa"
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
    t.integer "ibb"
    t.integer "hbp"
    t.integer "lob"
    t.integer "xbh"
    t.integer "ao"
    t.integer "go"
    t.integer "gidp"
    t.integer "gidp_opp"
    t.integer "sf"
    t.integer "sac"
    t.integer "cs"
    t.integer "roe"
    t.string "player_type"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id", "year"], name: "index_baseball_hitting_stats_on_player_id_and_year"
    t.index ["player_type", "player_id"], name: "index_baseball_hitting_stats_on_player"
  end

  create_table "baseball_pitching_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "g"
    t.float "ip"
    t.integer "gs"
    t.integer "gr"
    t.integer "cg"
    t.integer "sho"
    t.integer "nbb"
    t.integer "bf"
    t.integer "np"
    t.integer "h"
    t.integer "r"
    t.integer "er"
    t.integer "hr"
    t.integer "bb"
    t.integer "ibb"
    t.integer "so"
    t.integer "hbp"
    t.integer "w"
    t.integer "l"
    t.integer "sv"
    t.integer "bs"
    t.integer "hld"
    t.integer "qs"
    t.integer "gidp"
    t.integer "gidp_opp"
    t.integer "wp"
    t.integer "bk"
    t.integer "go"
    t.integer "ao"
    t.string "player_type"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id", "year"], name: "index_baseball_pitching_stats_on_player_id_and_year"
    t.index ["player_type", "player_id"], name: "index_baseball_pitching_stats_on_player"
  end

  create_table "cpbl_players", force: :cascade do |t|
    t.string "cpbl_player_id", default: "", null: false
    t.integer "number", null: false
    t.string "name", default: "", null: false
    t.string "throws", default: "", null: false
    t.string "bats", default: "", null: false
    t.integer "status", default: 0, null: false
    t.string "primary_stat_type", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cpbl_schedules", force: :cascade do |t|
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.string "location"
    t.string "game_id"
    t.string "home_score"
    t.string "away_score"
    t.string "match_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_cpbl_schedules_on_away_team_id"
    t.index ["home_team_id"], name: "index_cpbl_schedules_on_home_team_id"
  end

  create_table "cpbl_team_players", force: :cascade do |t|
    t.bigint "cpbl_player_id"
    t.bigint "cpbl_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpbl_player_id"], name: "index_cpbl_team_players_on_cpbl_player_id"
    t.index ["cpbl_team_id"], name: "index_cpbl_team_players_on_cpbl_team_id"
  end

  create_table "cpbl_teams", force: :cascade do |t|
    t.string "city", default: "", null: false
    t.string "full_name", default: "", null: false
    t.string "tricode", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "cpbl_schedules", "cpbl_teams", column: "away_team_id"
  add_foreign_key "cpbl_schedules", "cpbl_teams", column: "home_team_id"
end
