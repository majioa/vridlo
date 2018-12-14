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

ActiveRecord::Schema.define(version: 2018_12_14_112909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "name", null: false, comment: "Имя ветви"
    t.string "slug", null: false, comment: "Плашка ветви"
    t.integer "srpms_count", default: 0, comment: "Счётчик уникальных исходных пакетов для ветви"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_branches_on_name", unique: true
    t.index ["slug"], name: "index_branches_on_slug", unique: true
  end

  create_table "rpm_sources", force: :cascade do |t|
    t.string "slug", null: false, comment: "Плашка источника пакетов"
    t.string "name", null: false, comment: "Имя источника пакетов"
    t.string "path", null: false, comment: "Путь к местному хранилищу пакетов для данной архитектуры"
    t.bigint "branch_id", null: false, comment: "Указатель на ветвь, к которой принадлежит источник"
    t.boolean "primary", default: false, null: false, comment: "Первичный ли это источник пакетов для ветви"
    t.boolean "active", default: true, null: false, comment: "Задействован ли этот источник пакетов"
    t.boolean "published", default: true, null: false, comment: "Обнародован ли этот источник пакетов"
    t.integer "rpms_count", default: 0, null: false, comment: "Счётчик именованных пакетов для источника ветви"
    t.datetime "changed_at", default: "1970-01-01 00:00:00", null: false, comment: "Время последнего изменения пакетов для в источнике"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_rpm_sources_on_branch_id"
    t.index ["name"], name: "index_rpm_sources_on_name", unique: true
    t.index ["path"], name: "index_rpm_sources_on_path", unique: true
    t.index ["slug"], name: "index_rpm_sources_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rpm_sources", "branches"
end
