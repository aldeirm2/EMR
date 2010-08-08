# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100805205441) do

  create_table "appointments", :force => true do |t|
    t.string   "priority"
    t.datetime "arrive_date_time"
    t.text     "note"
    t.string   "status"
    t.text     "symptoms"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "date_of_appointment"
  end

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.string   "room"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "f_name"
    t.string   "m_name"
    t.string   "l_name"
    t.date     "date_of_birth"
    t.text     "medical_history"
    t.text     "address"
    t.string   "sex"
    t.date     "date_of_first_admission"
    t.string   "universal_ID"
    t.text     "next_of_kin"
    t.string   "allergies"
    t.text     "family_history"
    t.string   "blood_type"
    t.float    "weight"
    t.float    "height"
    t.string   "bmi"
    t.string   "occupation"
    t.text     "current_medication"
    t.integer  "tel_number"
    t.integer  "mobile_number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extension"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "show_appointments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",             :default => false, :null => false
  end

  create_table "visits", :force => true do |t|
    t.text     "symptoms"
    t.text     "provisional_diagnostics"
    t.text     "lab_test"
    t.text     "final_diagnostics"
    t.text     "method_of_treatment"
    t.text     "medication_perscribed"
    t.text     "comments"
    t.datetime "visit_time"
    t.boolean  "follow_up"
    t.time     "end_time"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
