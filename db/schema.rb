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

ActiveRecord::Schema.define(version: 20140914091724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.string   "unit_of_measure"
    t.string   "ingredient_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients_recipes", force: true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.integer  "step_number"
    t.string   "step_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions_recipes", id: false, force: true do |t|
    t.integer  "instruction_id", null: false
    t.integer  "recipe_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructions_recipes", ["instruction_id"], name: "index_instructions_recipes_on_instruction_id", using: :btree
  add_index "instructions_recipes", ["recipe_id"], name: "index_instructions_recipes_on_recipe_id", using: :btree

  create_table "recipe_users", force: true do |t|
    t.string   "user_name"
    t.string   "user_password"
    t.string   "screen_name"
    t.date     "date_joined"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "recipes", force: true do |t|
    t.string   "title"
    t.integer  "rating"
    t.date     "date_contributed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_user_id"
  end

  create_table "recipes_tags", id: false, force: true do |t|
    t.integer  "recipe_id",  null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes_tags", ["recipe_id"], name: "index_recipes_tags_on_recipe_id", using: :btree
  add_index "recipes_tags", ["tag_id"], name: "index_recipes_tags_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "tag_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tried_recipes", force: true do |t|
    t.integer  "recipe_id"
    t.date     "date_tried"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_user_id"
  end

end
