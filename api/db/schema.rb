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

ActiveRecord::Schema.define(version: 2018_09_23_011737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "programs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "updated_at"
    t.string "address"
    t.string "age_group_1"
    t.string "age_group_2"
    t.string "age_group_3"
    t.string "age_groups"
    t.string "branch_name"
    t.string "code"
    t.datetime "date"
    t.datetime "date_1"
    t.string "date_2"
    t.string "description"
    t.string "end_date"
    t.string "end_date1"
    t.string "end_time"
    t.string "event_type_1"
    t.string "event_type_2"
    t.string "event_type_3"
    t.string "event_types"
    t.string "extra_tag"
    t.string "friday"
    t.integer "friday_hours"
    t.string "fsa_x"
    t.string "fsa_y"
    t.string "gid"
    t.string "id_2"
    t.string "id_x"
    t.string "id_y"
    t.string "image_height"
    t.string "image_path"
    t.string "image_text"
    t.string "image_width"
    t.string "kid_stop_address"
    t.string "kid_stop_ward_number"
    t.string "length"
    t.string "link"
    t.string "link_address"
    t.string "link_text"
    t.string "location"
    t.string "monday"
    t.integer "monday_hours"
    t.string "nbhd_name_x"
    t.string "nbhd_name_y"
    t.integer "nbhd_number_x"
    t.integer "nbhd_number_y"
    t.string "other_info"
    t.string "postal_code"
    t.string "primary_event_type"
    t.integer "rcid"
    t.string "reading_address"
    t.string "reading_postal_code"
    t.integer "reading_ward_number"
    t.integer "record_type"
    t.string "saturday"
    t.integer "saturday_hours"
    t.string "status"
    t.string "sunday"
    t.integer "sunday_hours"
    t.string "thursday"
    t.integer "thursday_hours"
    t.string "tier"
    t.string "tier_x"
    t.string "tier_y"
    t.string "time"
    t.string "title"
    t.string "tuesday"
    t.integer "tuesday_hours"
    t.string "ward_region_x"
    t.string "ward_region_y"
    t.string "wednesday"
    t.integer "wednesday_hours"
    t.integer "weekly_scheduled_hours"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "master_category"
  end

end
