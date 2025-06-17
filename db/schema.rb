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

ActiveRecord::Schema[8.0].define(version: 2025_06_03_164034) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "grammar_rules", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "example_one"
    t.text "example_one_explanation"
    t.text "example_two"
    t.text "example_two_explanation"
    t.text "example_three"
    t.text "example_three_explanation"
    t.text "example_four"
    t.text "example_four_explanation"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_grammar_rules_on_subject_id"
  end

  create_table "lesson_grammar_rules", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "grammar_rule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grammar_rule_id"], name: "index_lesson_grammar_rules_on_grammar_rule_id"
    t.index ["lesson_id"], name: "index_lesson_grammar_rules_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "subject_id"
    t.text "section_one"
    t.text "example_one"
    t.text "example_one_explanation"
    t.text "section_two"
    t.text "example_two"
    t.text "example_two_explanation"
    t.text "section_three"
    t.text "example_three"
    t.text "example_three_explanation"
    t.text "section_four"
    t.text "example_four"
    t.text "example_four_explanation"
    t.text "section_five"
    t.text "example_five"
    t.text "example_five_explanation"
    t.text "section_six"
    t.text "example_six"
    t.text "example_six_explanation"
    t.text "section_seven"
    t.text "example_seven"
    t.text "example_seven_explanation"
    t.text "section_eight"
    t.text "example_eight"
    t.text "example_eight_explanation"
    t.text "section_nine"
    t.text "example_nine"
    t.text "example_nine_explanation"
    t.text "section_ten"
    t.text "example_ten"
    t.text "example_ten_explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grammar_rules", "subjects"
  add_foreign_key "lesson_grammar_rules", "grammar_rules"
  add_foreign_key "lesson_grammar_rules", "lessons"
  add_foreign_key "lessons", "subjects"
end
