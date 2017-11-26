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

ActiveRecord::Schema.define(version: 20171126194534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "spotify_id"
    t.string "lastfm_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
    t.index ["spotify_id"], name: "index_artists_on_spotify_id"
  end

  create_table "imports", force: :cascade do |t|
    t.string "name", default: "My import"
    t.bigint "user_id", null: false
    t.boolean "active", default: true, null: false
    t.boolean "processed", default: false, null: false
    t.datetime "processed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_imports_on_user_id"
  end

  create_table "imports_tracks", force: :cascade do |t|
    t.bigint "import_id", null: false
    t.bigint "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["import_id"], name: "index_imports_tracks_on_import_id"
    t.index ["track_id"], name: "index_imports_tracks_on_track_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
    t.bigint "import_id"
    t.datetime "full_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["import_id"], name: "index_playlists_on_import_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "artist_id", null: false
    t.string "spotify_id"
    t.string "lastfm_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["spotify_id"], name: "index_tracks_on_spotify_id"
    t.index ["title"], name: "index_tracks_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "lastfm_registration_date", default: -> { "now()" }, null: false
    t.string "lastfm_profile_image_url", default: "", null: false
    t.json "spotify_auth_object"
    t.json "lastfm_auth_object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token", default: "", null: false
    t.datetime "token_generation_date"
  end

  add_foreign_key "imports", "users"
  add_foreign_key "imports_tracks", "imports", on_delete: :cascade
  add_foreign_key "imports_tracks", "tracks"
  add_foreign_key "playlists", "imports"
  add_foreign_key "tracks", "artists"
end
