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

ActiveRecord::Schema.define(version: 20170830030526) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "answer",      limit: 65535
    t.integer  "player_id"
    t.integer  "question_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["player_id"], name: "index_answers_on_player_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "coaches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",         null: false
    t.string   "last_name",          null: false
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.string   "phone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "message",     limit: 65535
    t.integer  "category",                  null: false
    t.integer  "player_id"
    t.integer  "question_id"
    t.text     "url",         limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["player_id"], name: "index_notifications_on_player_id", using: :btree
    t.index ["question_id"], name: "index_notifications_on_question_id", using: :btree
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",         null: false
    t.string   "last_name",          null: false
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.string   "phone"
    t.integer  "gender",             null: false
    t.integer  "points",             null: false
    t.integer  "age",                null: false
    t.integer  "coach_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["coach_id"], name: "index_players_on_coach_id", using: :btree
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category",                    null: false
    t.integer  "age_range",                   null: false
    t.integer  "gender",                      null: false
    t.integer  "question_type",               null: false
    t.text     "options",       limit: 65535
    t.text     "question_text", limit: 65535, null: false
    t.integer  "coach_id"
    t.integer  "player_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["coach_id"], name: "index_questions_on_coach_id", using: :btree
    t.index ["player_id"], name: "index_questions_on_player_id", using: :btree
  end

  add_foreign_key "answers", "players"
  add_foreign_key "answers", "questions"
  add_foreign_key "notifications", "players"
  add_foreign_key "notifications", "questions"
  add_foreign_key "players", "coaches"
  add_foreign_key "questions", "coaches"
  add_foreign_key "questions", "players"
end
