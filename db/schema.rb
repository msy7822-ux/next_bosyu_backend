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

ActiveRecord::Schema.define(version: 2021_12_04_081758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "corporate_id"
    t.bigint "job_offer_slip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["corporate_id"], name: "index_contracts_on_corporate_id"
    t.index ["job_offer_slip_id"], name: "index_contracts_on_job_offer_slip_id"
    t.index ["user_id", "corporate_id", "job_offer_slip_id"], name: "contract_index", unique: true
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "corporates", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_corporates_on_user_id"
  end

  create_table "job_offer_slips", force: :cascade do |t|
    t.bigint "corporate_id"
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.text "content", null: false
    t.boolean "displayed", default: true, null: false
    t.index ["corporate_id"], name: "index_job_offer_slips_on_corporate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.text "imageUrl"
    t.string "token", null: false
    t.string "display_name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "watch_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_offer_slip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_offer_slip_id"], name: "index_watch_histories_on_job_offer_slip_id"
    t.index ["user_id", "job_offer_slip_id"], name: "index_watch_histories_on_user_id_and_job_offer_slip_id", unique: true
    t.index ["user_id"], name: "index_watch_histories_on_user_id"
  end

  add_foreign_key "contracts", "corporates"
  add_foreign_key "contracts", "job_offer_slips"
  add_foreign_key "contracts", "users"
  add_foreign_key "corporates", "users"
  add_foreign_key "job_offer_slips", "corporates"
  add_foreign_key "watch_histories", "job_offer_slips"
  add_foreign_key "watch_histories", "users"
end
