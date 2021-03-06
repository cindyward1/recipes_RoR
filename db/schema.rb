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

ActiveRecord::Schema.define(version: 20140916163600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.date     "date_contributed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_user_id"
    t.integer  "number_ratings"
    t.float    "rating"
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
    t.integer  "user_id"
    t.integer  "recipe_user_id"
  end

end
