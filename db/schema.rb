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

ActiveRecord::Schema.define(:version => 20100225201826) do

  create_table "affiliates", :force => true do |t|
    t.string   "org_name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "domain"
    t.integer  "siteid"
    t.string   "name_abbr"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "tty"
    t.string   "fax"
    t.string   "email"
    t.text     "description"
    t.string   "metric"
    t.boolean  "activate"
    t.boolean  "public"
    t.string   "region"
    t.string   "province"
    t.string   "country"
    t.string   "aff_type"
    t.integer  "template"
    t.integer  "state_ind"
    t.float    "lat"
    t.float    "long"
  end

  create_table "events", :force => true do |t|
    t.integer  "affiliate_id"
    t.string   "name"
    t.string   "url"
    t.datetime "date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
