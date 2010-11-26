# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100606205154) do

  create_table "bouts", :force => true do |t|
    t.integer  "red_id"
    t.integer  "green_id"
    t.integer  "red_final"
    t.integer  "green_final"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "red_team_id"
    t.integer  "green_team_id"
    t.string   "weight_class"
    t.string   "result"
    t.string   "time"
    t.integer  "team_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bouts_wrestlers", :id => false, :force => true do |t|
    t.integer  "wrestler_id"
    t.integer  "bout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bouts_wrestlers", ["bout_id"], :name => "index_bouts_wrestlers_on_bout_id"
  add_index "bouts_wrestlers", ["wrestler_id", "bout_id"], :name => "index_bouts_wrestlers_on_wrestler_id_and_bout_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "host"
    t.string   "country"
    t.string   "state"
    t.string   "address"
    t.string   "zip_code"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_teams", :id => false, :force => true do |t|
    t.integer  "team_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_teams", ["event_id"], :name => "index_events_teams_on_event_id"
  add_index "events_teams", ["team_id", "event_id"], :name => "index_events_teams_on_team_id_and_event_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "scored_on_id"
    t.integer  "score_value"
    t.integer  "score_order"
    t.string   "score_type"
    t.string   "match_time"
    t.boolean  "first_score"
    t.boolean  "first_takedown"
    t.integer  "bout_id"
    t.integer  "wrestler_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "team_name"
    t.string   "country"
    t.string   "state"
    t.string   "organization"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_wrestlers", :id => false, :force => true do |t|
    t.integer  "wrestler_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams_wrestlers", ["team_id"], :name => "index_teams_wrestlers_on_team_id"
  add_index "teams_wrestlers", ["wrestler_id", "team_id"], :name => "index_teams_wrestlers_on_wrestler_id_and_team_id"

  create_table "users", :force => true do |t|
    t.string   "username",   :limit => 60
    t.string   "password"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wrestlers", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "weight_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
