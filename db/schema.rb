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

ActiveRecord::Schema.define(version: 20150731061430) do

  create_table "acquisitions", force: :cascade do |t|
    t.integer  "parent_id",  limit: 4
    t.integer  "child_id",   limit: 4
    t.integer  "amount",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "amount",        limit: 4
    t.integer  "investor_id",   limit: 4
    t.string   "investor_type", limit: 255
    t.integer  "investee_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "joins", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.integer  "person_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "type",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
