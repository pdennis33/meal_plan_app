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

ActiveRecord::Schema[7.0].define(version: 2024_07_05_140657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_meals", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "meal_id", null: false
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredients_meals_on_ingredient_id"
    t.index ["meal_id"], name: "index_ingredients_meals_on_meal_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals_meal_plans", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "meal_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meals_meal_plans_on_meal_id"
    t.index ["meal_plan_id"], name: "index_meals_meal_plans_on_meal_plan_id"
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

  add_foreign_key "ingredients_meals", "ingredients"
  add_foreign_key "ingredients_meals", "meals"
  add_foreign_key "meal_plans", "users"
  add_foreign_key "meals_meal_plans", "meal_plans"
  add_foreign_key "meals_meal_plans", "meals"
end
