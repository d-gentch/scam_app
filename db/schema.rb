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

ActiveRecord::Schema[7.0].define(version: 2022_12_27_130748) do
  create_table "items", force: :cascade do |t|
    t.string "content"
    t.boolean "checkbox"
    t.integer "todo_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "todo_comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.integer "todo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_todo_comments_on_todo_id"
    t.index ["user_id"], name: "index_todo_comments_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checkable", default: false, null: false
    t.integer "rating", default: 0
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_todos", force: :cascade do |t|
    t.integer "todo_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_users_todos_on_todo_id"
    t.index ["user_id"], name: "index_users_todos_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "todo_id", null: false
    t.integer "user_id", null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_votes_on_todo_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "items", "todos"
  add_foreign_key "items", "users"
  add_foreign_key "todo_comments", "todos"
  add_foreign_key "todo_comments", "users"
  add_foreign_key "todos", "users"
  add_foreign_key "users_todos", "todos"
  add_foreign_key "users_todos", "users"
  add_foreign_key "votes", "todos"
  add_foreign_key "votes", "users"
end
