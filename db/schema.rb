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

ActiveRecord::Schema.define(version: 20160601143244) do

  create_table "bookings", force: true do |t|
    t.string   "uuid",          limit: 20,                    null: false
    t.string   "user_uuid",     limit: 20,                    null: false
    t.string   "service_uuid",  limit: 20,                    null: false
    t.string   "time_slots",               default: "[]"
    t.string   "booking_token"
    t.integer  "cost"
    t.string   "status",                   default: "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  create_table "day_slots", force: true do |t|
    t.string   "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_busies", force: true do |t|
    t.string   "uuid",         limit: 20, null: false
    t.integer  "time_slot_1"
    t.integer  "time_slot_2"
    t.integer  "time_slot_3"
    t.integer  "time_slot_4"
    t.integer  "time_slot_5"
    t.integer  "time_slot_6"
    t.integer  "time_slot_7"
    t.integer  "time_slot_8"
    t.integer  "time_slot_9"
    t.integer  "time_slot_10"
    t.integer  "time_slot_11"
    t.integer  "time_slot_12"
    t.integer  "time_slot_13"
    t.integer  "time_slot_14"
    t.integer  "time_slot_15"
    t.integer  "time_slot_16"
    t.integer  "time_slot_17"
    t.integer  "time_slot_18"
    t.integer  "time_slot_19"
    t.integer  "time_slot_20"
    t.integer  "time_slot_21"
    t.integer  "time_slot_22"
    t.integer  "time_slot_23"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gyms", force: true do |t|
    t.string   "name",                                                                    null: false
    t.integer  "user_id",                                                                 null: false
    t.string   "icon",            limit: 500
    t.string   "banner",          limit: 500
    t.string   "uuid",            limit: 20,                                              null: false
    t.integer  "offer_id",                                             default: 0
    t.string   "time_slot_ids",                                        default: "[]"
    t.string   "status",                                               default: "Active"
    t.string   "contact_number1", limit: 10
    t.string   "contact_number2", limit: 10
    t.integer  "location_id"
    t.decimal  "latitude",                     precision: 9, scale: 6, default: 0.0
    t.decimal  "longitude",                    precision: 9, scale: 6, default: 0.0
    t.integer  "booking_count",                                        default: 0
    t.string   "caption",                                              default: ""
    t.string   "details",         limit: 1000,                         default: ""
    t.string   "address",         limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gyms", ["location_id"], name: "index_gyms_on_location_id", using: :btree
  add_index "gyms", ["offer_id"], name: "index_gyms_on_offer_id", using: :btree
  add_index "gyms", ["user_id"], name: "index_gyms_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "offers", force: true do |t|
    t.string   "offer"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.boolean  "is_day_offer"
    t.boolean  "is_time_slot_offer"
    t.string   "time_slot",          default: "[]"
    t.string   "day_slot",           default: "[]"
    t.integer  "discount",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salons", force: true do |t|
    t.string   "name",                                                                    null: false
    t.integer  "user_id",                                                                 null: false
    t.string   "icon",            limit: 500
    t.string   "banner",          limit: 500
    t.string   "uuid",            limit: 20,                                              null: false
    t.integer  "offer_id",                                             default: 0
    t.string   "time_slot_ids",                                        default: "[]"
    t.string   "status",                                               default: "Active"
    t.string   "contact_number1", limit: 10
    t.string   "contact_number2", limit: 10
    t.integer  "location_id"
    t.decimal  "latitude",                     precision: 9, scale: 6, default: 0.0
    t.decimal  "longitude",                    precision: 9, scale: 6, default: 0.0
    t.integer  "booking_count",                                        default: 0
    t.string   "caption",                                              default: ""
    t.string   "details",         limit: 1000,                         default: ""
    t.string   "address",         limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salons", ["location_id"], name: "index_salons_on_location_id", using: :btree
  add_index "salons", ["offer_id"], name: "index_salons_on_offer_id", using: :btree
  add_index "salons", ["user_id"], name: "index_salons_on_user_id", using: :btree

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "uuid",         limit: 20, null: false
    t.string   "shop_uuid",    limit: 20, null: false
    t.integer  "service_type",            null: false
    t.string   "name"
    t.integer  "cost",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spas", force: true do |t|
    t.string   "name",                                                                    null: false
    t.integer  "user_id",                                                                 null: false
    t.string   "icon",            limit: 500
    t.string   "banner",          limit: 500
    t.string   "uuid",            limit: 20,                                              null: false
    t.integer  "offer_id",                                             default: 0
    t.string   "time_slot_ids",                                        default: "[]"
    t.string   "status",                                               default: "Active"
    t.string   "contact_number1", limit: 10
    t.string   "contact_number2", limit: 10
    t.integer  "location_id"
    t.decimal  "latitude",                     precision: 9, scale: 6, default: 0.0
    t.decimal  "longitude",                    precision: 9, scale: 6, default: 0.0
    t.integer  "booking_count",                                        default: 0
    t.string   "caption",                                              default: ""
    t.string   "details",         limit: 1000,                         default: ""
    t.string   "address",         limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spas", ["location_id"], name: "index_spas_on_location_id", using: :btree
  add_index "spas", ["offer_id"], name: "index_spas_on_offer_id", using: :btree
  add_index "spas", ["user_id"], name: "index_spas_on_user_id", using: :btree

  create_table "sport_centres", force: true do |t|
    t.string   "name",                                                                    null: false
    t.integer  "user_id",                                                                 null: false
    t.string   "icon",            limit: 500
    t.string   "banner",          limit: 500
    t.string   "uuid",            limit: 20,                                              null: false
    t.integer  "offer_id",                                             default: 0
    t.string   "time_slot_ids",                                        default: "[]"
    t.string   "status",                                               default: "Active"
    t.string   "contact_number1", limit: 10
    t.string   "contact_number2", limit: 10
    t.integer  "location_id"
    t.decimal  "latitude",                     precision: 9, scale: 6, default: 0.0
    t.decimal  "longitude",                    precision: 9, scale: 6, default: 0.0
    t.integer  "booking_count",                                        default: 0
    t.string   "caption",                                              default: ""
    t.string   "details",         limit: 1000,                         default: ""
    t.string   "address",         limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sport_centres", ["location_id"], name: "index_sport_centres_on_location_id", using: :btree
  add_index "sport_centres", ["offer_id"], name: "index_sport_centres_on_offer_id", using: :btree
  add_index "sport_centres", ["user_id"], name: "index_sport_centres_on_user_id", using: :btree

  create_table "time_slots", force: true do |t|
    t.string   "time_frame"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "email"
    t.string   "uuid",                 limit: 20,                    null: false
    t.string   "contact_number1",      limit: 10
    t.string   "contact_number2",      limit: 10
    t.date     "last_logged_in"
    t.boolean  "is_first_logged_in",              default: false
    t.boolean  "is_super_user",                   default: false
    t.boolean  "is_owner",                        default: false
    t.integer  "failed_attempts",                 default: 0
    t.string   "loyality_discount_at",            default: "[]"
    t.string   "user_last_location",              default: ""
    t.string   "status",                          default: "Active"
    t.integer  "number_of_bookings",              default: 0
    t.integer  "transaction",          limit: 8,  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
