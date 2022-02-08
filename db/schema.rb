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

ActiveRecord::Schema.define(version: 2022_02_08_004952) do

  create_table "addativos", force: :cascade do |t|
    t.integer "vinculo_id"
    t.string "tombo"
    t.string "description"
    t.string "condition"
    t.string "situation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vinculo_id"], name: "index_addativos_on_vinculo_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ativos", force: :cascade do |t|
    t.integer "type_id"
    t.string "description"
    t.string "serial"
    t.string "tombo"
    t.text "specification"
    t.string "invoice"
    t.date "date_acquisition"
    t.string "warranty"
    t.string "ata"
    t.string "bidding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_ativos_on_type_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situations", force: :cascade do |t|
    t.integer "condition_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_situations_on_condition_id"
  end

  create_table "subareas", force: :cascade do |t|
    t.string "description"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_subareas_on_area_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vinculos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "area_id"
    t.integer "subarea_id"
    t.string "detvinculo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_vinculos_on_area_id"
    t.index ["subarea_id"], name: "index_vinculos_on_subarea_id"
    t.index ["user_id"], name: "index_vinculos_on_user_id"
  end

end
