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

ActiveRecord::Schema.define(version: 2020_12_09_131835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "tips", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "odd", null: false
    t.string "sport"
    t.string "tip", null: false
    t.string "league"
    t.string "game", null: false
    t.float "unit", null: false
    t.string "description"
    t.string "status", null: false
    t.boolean "closed", default: false
    t.datetime "scheduled_at", default: -> { "(CURRENT_TIMESTAMP + '01:00:00'::interval hour)" }
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "user_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "token", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday_date", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "description"
    t.string "avatar"
    t.string "phone_number", limit: 13
    t.string "telegram"
    t.string "facebook"
    t.string "whatsapp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "tips", "users"
  add_foreign_key "user_tokens", "users"
end
