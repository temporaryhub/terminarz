# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "Schedules", primary_key: "id_schedule", force: true do |t|
    t.integer  "doctor_id",   null: false
    t.integer  "patient_id",  null: false
    t.datetime "start_date",  null: false
    t.datetime "end_date",    null: false
    t.text     "descirption", null: false
  end

  add_index "Schedules", ["doctor_id"], name: "doctor_index", using: :btree
  add_index "Schedules", ["patient_id"], name: "patient_id", using: :btree

  create_table "Specializations", primary_key: "id_specialization", force: true do |t|
    t.string "name", null: false
  end

  create_table "Users", primary_key: "id_user", force: true do |t|
    t.string  "login",             null: false
    t.string  "password",          null: false
    t.string  "email",             null: false
    t.string  "first_name",        null: false
    t.string  "last_name",         null: false
    t.integer "specialization_id"
    t.string  "password_digest"
    t.string  "remember_token"
  end

  add_index "Users", ["specialization_id"], name: "specialization_index", using: :btree
  add_index "Users", ["email"], name: "index_users_on_email", using: :btree
  add_index "Users", ["remember_token"], name: "index_users_on_remember", using: :btree

end
