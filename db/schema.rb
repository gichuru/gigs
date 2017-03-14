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

ActiveRecord::Schema.define(version: 20170306094332) do

  create_table "abilities", force: :cascade do |t|
    t.integer "gig_id"
    t.integer "skill_id"
    t.index ["gig_id"], name: "index_abilities_on_gig_id"
    t.index ["skill_id"], name: "index_abilities_on_skill_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "companies", force: :cascade do |t|
    t.string "cname"
    t.string "industry"
    t.string "email"
    t.string "website"
    t.string "location"
    t.string "description"
  end

  create_table "edus", force: :cascade do |t|
    t.string  "sname"
    t.date    "sdate"
    t.date    "edate"
    t.string  "course"
    t.string  "description"
    t.integer "resume_id"
    t.index ["resume_id"], name: "index_edus_on_resume_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "budget"
    t.date     "startdate"
    t.integer  "duration"
    t.string   "location"
    t.boolean  "open",               default: true
    t.integer  "awarded_internship"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "company_id"
    t.integer  "category_id"
    t.integer  "user_id"
    t.index ["category_id"], name: "index_gigs_on_category_id"
    t.index ["company_id"], name: "index_gigs_on_company_id"
    t.index ["user_id"], name: "index_gigs_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string  "cname"
    t.string  "role"
    t.date    "sdate"
    t.date    "edate"
    t.text    "description"
    t.integer "resume_id"
    t.index ["resume_id"], name: "index_jobs_on_resume_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gig_id"
    t.integer  "user_id"
    t.index ["gig_id"], name: "index_proposals_on_gig_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string  "fname"
    t.string  "lname"
    t.date    "age"
    t.string  "phone"
    t.string  "category"
    t.string  "bio"
    t.integer "user_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
