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

ActiveRecord::Schema.define(version: 20_221_222_172_424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'answers', force: :cascade do |t|
    t.string 'value'
    t.integer 'form_id'
    t.integer 'question_id'
    t.integer 'next_question_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[form_id question_id id], name: 'index_answers_on_form_id_and_question_id_and_id'
    t.index ['next_question_id'], name: 'index_answers_on_next_question_id'
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'forms', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'description', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.integer 'form_id', null: false
    t.integer 'answer_type', null: false
    t.json 'additional_attributes'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.index %w[form_id id], name: 'index_questions_on_form_id_and_id'
    t.index ['form_id'], name: 'index_questions_on_form_id'
  end
end
