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

ActiveRecord::Schema.define(version: 2021_10_18_122525) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dev_profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.date "date_of_birth"
    t.string "academic_education"
    t.string "previous_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dev_id"
    t.string "description"
    t.integer "expertise_id"
    t.index ["dev_id"], name: "index_dev_profiles_on_dev_id"
    t.index ["expertise_id"], name: "index_dev_profiles_on_expertise_id"
  end

  create_table "devs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_devs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_devs_on_reset_password_token", unique: true
  end

  create_table "expertises", force: :cascade do |t|
    t.string "field_of_expertise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_propositions", force: :cascade do |t|
    t.string "motivation"
    t.decimal "expected_payment"
    t.integer "available_hours_per_week"
    t.string "expectations"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dev_id"
    t.integer "project_id"
    t.string "rejection_motive"
    t.string "cancel_motive"
    t.date "accepted_time"
    t.index ["dev_id"], name: "index_project_propositions_on_dev_id"
    t.index ["project_id"], name: "index_project_propositions_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "detailed_description"
    t.string "skill_sets"
    t.decimal "max_payment_per_hour"
    t.date "hire_date_limit"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_type_id"
    t.integer "status", default: 0
    t.integer "accepting_devs"
    t.index ["user_id"], name: "index_projects_on_user_id"
    t.index ["work_type_id"], name: "index_projects_on_work_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
