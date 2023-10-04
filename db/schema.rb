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

ActiveRecord::Schema[7.0].define(version: 2023_06_20_090809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "bloom"
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intagg"
  enable_extension "intarray"
  enable_extension "isn"
  enable_extension "lo"
  enable_extension "ltree"
  enable_extension "pg_buffercache"
  enable_extension "pg_prewarm"
  enable_extension "pg_similarity"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_trainings", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "training_id", null: false
    t.string "season", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_trainings_on_employee_id"
    t.index ["training_id"], name: "index_employee_trainings_on_training_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "department", null: false
    t.string "location", null: false
    t.string "otp_secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "employee", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string "training_title", null: false
    t.string "training_type"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "parent_category"
    t.index ["category_id"], name: "index_trainings_on_category_id"
  end

  add_foreign_key "employee_trainings", "employees"
  add_foreign_key "employee_trainings", "trainings"
  add_foreign_key "trainings", "categories"
end
