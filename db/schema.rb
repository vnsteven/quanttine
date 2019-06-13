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

ActiveRecord::Schema.define(version: 2019_06_11_204951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_admins_on_school_id"
  end

  create_table "daily_services", force: :cascade do |t|
    t.string "date"
    t.bigint "school_id"
    t.string "queue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_daily_services_on_school_id"
  end

  create_table "food_supplies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_table_preference_foods", force: :cascade do |t|
    t.bigint "preference_id"
    t.bigint "food_supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_supply_id"], name: "index_join_table_preference_foods_on_food_supply_id"
    t.index ["preference_id"], name: "index_join_table_preference_foods_on_preference_id"
  end

  create_table "join_table_profile_preferences", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_join_table_profile_preferences_on_preference_id"
    t.index ["profile_id"], name: "index_join_table_profile_preferences_on_profile_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preparing_user_meals", force: :cascade do |t|
    t.integer "serving_size"
    t.bigint "user_meal_id"
    t.bigint "serving_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serving_id"], name: "index_preparing_user_meals_on_serving_id"
    t.index ["user_meal_id"], name: "index_preparing_user_meals_on_user_meal_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.boolean "active"
    t.index ["school_id"], name: "index_profiles_on_school_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "school_id"
    t.bigint "food_supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_supply_id"], name: "index_quantities_on_food_supply_id"
    t.index ["school_id"], name: "index_quantities_on_school_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "school_name"
    t.string "school_city"
    t.string "email"
    t.string "question_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_meals", force: :cascade do |t|
    t.datetime "date"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_meals_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "school_type"
    t.string "city"
    t.string "street_address"
    t.string "billing_address"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.string "stripe_customer_id"
    t.string "stripe_subscription_id"
    t.string "stripe_plan_id"
    t.string "school_code"
  end

  create_table "servings", force: :cascade do |t|
    t.integer "meal_category"
    t.bigint "school_meal_id"
    t.bigint "food_supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_supply_id"], name: "index_servings_on_food_supply_id"
    t.index ["school_meal_id"], name: "index_servings_on_school_meal_id"
  end

  create_table "user_meals", force: :cascade do |t|
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_user_meals_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "school_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admins", "schools"
  add_foreign_key "daily_services", "schools"
  add_foreign_key "profiles", "schools"
end
