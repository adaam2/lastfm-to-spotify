class AddBaseTables < ActiveRecord::Migration[5.1]
  def change
    # Creates the base convertor tables

    create_table :artists do |t|
      t.string :name, null: false, index: true
      t.string :spotify_id, null: true, index: true
      t.string :lastfm_url, null: true
      t.timestamps
    end

    create_table :tracks do |t|
      t.string :title, null: false, index: true
      t.references :artist, null: false, index: true, foreign_key: true
      t.string :spotify_id, null: true, index: true
      t.string :lastfm_url, null: true
      t.timestamps
    end

    create_table :users do |t|
      t.datetime :lastfm_registration_date, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.string :lastfm_profile_image_url, null: false, default: ""
      t.json :spotify_auth_object
      t.json :lastfm_auth_object
      t.timestamps
    end

    create_table :imports do |t|
      t.string :name, null: true, default: "My import"
      t.references :user, null: false, foreign_key: true
      t.boolean :active, null: false, default: true
      t.boolean :processed, null: false, default: false
      t.datetime :processed_date
      t.timestamps
    end

    create_table :imports_tracks do |t|
      t.references :import, null: false, index: true, foreign_key: true
      t.references :track, null: false, index: true, foreign_key: true
      t.timestamps
    end

    create_table :playlists do |t|
      t.string :name
      t.string :spotify_id
      t.references :import, foreign_key: true, index: true
      t.datetime :full_at, null: true
      t.timestamps
    end
  end
end
