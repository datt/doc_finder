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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140920150626) do

  create_table "appointments", :force => true do |t|
    t.integer  "patient_id"
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "cancel",     :default => false
    t.integer  "clinic_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "appointments", ["clinic_id"], :name => "index_appointments_on_clinic_id"
  add_index "appointments", ["patient_id"], :name => "index_appointments_on_patient_id"

  create_table "availbilities", :force => true do |t|
    t.string   "day"
    t.datetime "from"
    t.datetime "to"
    t.integer  "clinic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clinics", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.string   "contact"
    t.string   "lat"
    t.string   "long"
    t.integer  "doctor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clinics", ["doctor_id"], :name => "index_clinics_on_doctor_id"

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.integer  "age"
    t.string   "email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "permalink"
    t.string   "degree"
    t.text     "expertise"
    t.string   "phone_no"
    t.date     "practicing"
    t.float    "fees"
    t.string   "image"
  end

  add_index "doctors", ["email"], :name => "index_doctors_on_email", :unique => true

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "contact"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "permalink"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_roles", ["role_id"], :name => "index_user_roles_on_role_id"
  add_index "user_roles", ["user_id"], :name => "index_user_roles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
