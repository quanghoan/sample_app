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

ActiveRecord::Schema.define(version: 20151208094517) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["micropost_id"], name: "index_comments_on_micropost_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "likeables", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likeables", ["micropost_id"], name: "index_likeables_on_micropost_id"
  add_index "likeables", ["user_id", "micropost_id"], name: "index_likeables_on_user_id_and_micropost_id", unique: true
  add_index "likeables", ["user_id"], name: "index_likeables_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likes", ["micropost_id"], name: "index_likes_on_micropost_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "log_times", force: :cascade do |t|
    t.datetime "log_time"
    t.string   "log_type"
    t.string   "log_message"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "log_times", ["user_id"], name: "index_log_times_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.integer  "comment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "notifications", ["comment_id"], name: "index_notifications_on_comment_id"
  add_index "notifications", ["micropost_id"], name: "index_notifications_on_micropost_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "steps", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "hour"
    t.integer  "day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "steps", ["template_id"], name: "index_steps_on_template_id"

  create_table "templates", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "subject"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "templates", ["user_id", "created_at"], name: "index_templates_on_user_id_and_created_at"
  add_index "templates", ["user_id"], name: "index_templates_on_user_id"

  create_table "user_steps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_steps", ["step_id"], name: "index_user_steps_on_step_id"
  add_index "user_steps", ["user_id"], name: "index_user_steps_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "login_at"
    t.datetime "logout_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
