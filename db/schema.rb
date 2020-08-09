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

ActiveRecord::Schema.define(version: 2020_08_03_144419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draws", force: :cascade do |t|
    t.bigint "pool_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pool_id"], name: "index_draws_on_pool_id"
  end

  create_table "gifters", force: :cascade do |t|
    t.bigint "draw_id", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draw_id"], name: "index_gifters_on_draw_id"
    t.index ["participant_id"], name: "index_gifters_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "pool_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "companion_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pool_id"], name: "index_participants_on_pool_id"
  end

  create_table "pools", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pools_on_user_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.bigint "draw_id", null: false
    t.bigint "participant_id", null: false
    t.bigint "gifter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draw_id"], name: "index_receivers_on_draw_id"
    t.index ["gifter_id"], name: "index_receivers_on_gifter_id"
    t.index ["participant_id"], name: "index_receivers_on_participant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "first_name"
    t.integer "partner_id", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "draws", "pools"
  add_foreign_key "gifters", "draws"
  add_foreign_key "gifters", "participants"
  add_foreign_key "participants", "pools"
  add_foreign_key "pools", "users"
  add_foreign_key "receivers", "draws"
  add_foreign_key "receivers", "gifters"
  add_foreign_key "receivers", "participants"
end
