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

ActiveRecord::Schema.define(version: 20161021062903) do

  create_table "taxes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "user_vorname"
    t.string   "user_sex"
    t.string   "user_pw"
    t.decimal    "brutto"
    t.decimal    "qsteuer"
    t.decimal    "qsteuer_p"
    t.decimal    "suva"
    t.decimal    "suva_p"
    t.decimal    "ahv"
    t.decimal    "ahv_p"
    t.decimal    "alv"
    t.decimal    "alv_p"
    t.decimal    "pk"
    t.decimal    "pk_p"
    t.decimal    "kv"
    t.decimal    "sum"
    t.decimal    "sum_fw"
    t.decimal    "kurs"
    t.decimal    "steuer_fw"
    t.decimal    "soli_fw"
    t.decimal    "kirche_fw"
    t.decimal    "anrechnung_q"
    t.decimal    "steuervoraus"
    t.decimal    "netto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
