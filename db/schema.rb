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

ActiveRecord::Schema.define(version: 20161216081213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "rewards"
    t.integer  "total_contributors"
    t.integer  "total_amount_contribute"
    t.string   "cover_photo"
    t.string   "taggings"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "goal_id"
    t.json     "campaign_images"
  end

  add_index "campaigns", ["goal_id"], name: "index_campaigns_on_goal_id", using: :btree
  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "campaigns_tags", id: false, force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "tag_id"
  end

  add_index "campaigns_tags", ["campaign_id"], name: "index_campaigns_tags_on_campaign_id", using: :btree
  add_index "campaigns_tags", ["tag_id"], name: "index_campaigns_tags_on_tag_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.text     "body"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "goal_per_month"
    t.integer  "current_per_month"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string  "interest_name"
    t.integer "category_id"
  end

  add_index "interests", ["category_id"], name: "index_interests_on_category_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.integer  "transaction_amount"
    t.string   "transaction_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "payments", ["campaign_id"], name: "index_payments_on_campaign_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "campaign_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.json     "post_images"
  end

  add_index "posts", ["campaign_id"], name: "index_posts_on_campaign_id", using: :btree

  create_table "profile_interests", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "interest_id"
  end

  add_index "profile_interests", ["interest_id"], name: "index_profile_interests_on_interest_id", using: :btree
  add_index "profile_interests", ["profile_id"], name: "index_profile_interests_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "description"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "city"
    t.string   "interest",                   array: true
    t.string   "gender"
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "campaign_id"
    t.decimal  "amount"
    t.string   "description"
    t.string   "rewards_class"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rewards", ["campaign_id"], name: "index_rewards_on_campaign_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "words"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "streams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.string   "opentok_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "streams", ["user_id"], name: "index_streams_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "email"
    t.string   "encrypted_password",    limit: 128
    t.string   "confirmation_token",    limit: 128
    t.string   "remember_token",        limit: 128
    t.string   "password_confirmation"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "viewers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stream_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "viewers", ["stream_id"], name: "index_viewers_on_stream_id", using: :btree
  add_index "viewers", ["user_id"], name: "index_viewers_on_user_id", using: :btree

  add_foreign_key "campaigns_tags", "campaigns"
  add_foreign_key "campaigns_tags", "tags"
  add_foreign_key "comments", "posts"
  add_foreign_key "rewards", "campaigns"
  add_foreign_key "searches", "users"
  add_foreign_key "streams", "users"
  add_foreign_key "viewers", "streams"
  add_foreign_key "viewers", "users"
end
