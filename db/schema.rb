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

ActiveRecord::Schema.define(version: 2021_06_18_094838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mappings", force: :cascade do |t|
    t.string "map_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "content", null: false
    t.string "teaming_stages", null: false
    t.integer "appears_day", null: false
    t.integer "frequency", null: false
    t.string "question_type", null: false
    t.boolean "required", null: false
    t.string "conditions", null: false
    t.bigint "role_id", null: false
    t.bigint "mapping_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content", "role_id", "mapping_id"], name: "index_questions_on_content_and_role_id_and_mapping_id", unique: true
    t.index ["mapping_id"], name: "index_questions_on_mapping_id"
    t.index ["role_id"], name: "index_questions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "questions", "mappings"
  add_foreign_key "questions", "roles"
end
