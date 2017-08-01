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

ActiveRecord::Schema.define(version: 20170727202948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organisation_id"], name: "index_announcements_on_organisation_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "event_type"
    t.datetime "event_date"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "event_pic"
    t.index ["organisation_id"], name: "index_events_on_organisation_id", using: :btree
  end

  create_table "fundraisings", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "city"
    t.string   "country"
    t.string   "campaign_duration"
    t.integer  "organisation_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "campaign_pic"
    t.index ["organisation_id"], name: "index_fundraisings_on_organisation_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.index ["organisation_id"], name: "index_groups_on_organisation_id", using: :btree
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "company_name"
    t.string   "position"
    t.string   "job_description"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organisation_id"], name: "index_jobs_on_organisation_id", using: :btree
  end

  create_table "membershipdata", force: :cascade do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "YearCompleted"
    t.string   "Email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organisation_id"
    t.string   "Organisation"
    t.string   "WorkPlace"
    t.string   "PhoneNumber"
    t.index ["organisation_id"], name: "index_membershipdata_on_organisation_id", using: :btree
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "organisation_name"
    t.index ["email"], name: "index_organisations_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_organisations_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "Last_name"
    t.string   "organisation_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone_number"
    t.string   "profession"
    t.string   "education"
    t.string   "skills"
    t.string   "user_pic"
    t.string   "YearGroup"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "announcements", "organisations"
  add_foreign_key "events", "organisations"
  add_foreign_key "fundraisings", "organisations"
  add_foreign_key "groups", "organisations"
  add_foreign_key "groups", "users"
  add_foreign_key "jobs", "organisations"
  add_foreign_key "membershipdata", "organisations"
end
