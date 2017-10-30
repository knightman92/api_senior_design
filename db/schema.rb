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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171020015903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "answers", force: :cascade do |t|
    t.text     "answer"
    t.integer  "points",      null: false
    t.integer  "player_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["player_id"], name: "index_answers_on_player_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "coaches", force: :cascade do |t|
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.string   "phone"
    t.string   "auth_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "message"
    t.integer  "question_id"
    t.text     "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_notifications_on_question_id", using: :btree
  end

  create_table "player_notifications", force: :cascade do |t|
    t.integer  "notification_id"
    t.integer  "player_id"
    t.integer  "counter",         default: 0
    t.integer  "received",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["notification_id"], name: "index_player_notifications_on_notification_id", using: :btree
    t.index ["player_id"], name: "index_player_notifications_on_player_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name",                         null: false
    t.string   "last_name",                          null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "phone"
    t.integer  "gender",                             null: false
    t.integer  "age",                                null: false
    t.integer  "coach_id"
    t.integer  "points",                 default: 0, null: false
    t.integer  "age_range",                          null: false
    t.string   "auth_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["coach_id"], name: "index_players_on_coach_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "category",                  null: false
    t.integer  "age_range",                 null: false
    t.integer  "gender",                    null: false
    t.integer  "question_type",             null: false
    t.text     "options"
    t.text     "question_text"
    t.integer  "coach_id"
    t.integer  "player_id"
    t.integer  "patternMulti",  default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["coach_id"], name: "index_questions_on_coach_id", using: :btree
    t.index ["player_id"], name: "index_questions_on_player_id", using: :btree
  end

end
