ActiveAdmin.register Import do
  filter :user, label: 'User', collection: proc { User.with_imports }

  index do
    column :id
    column :name
    column :user
    column :number_of_tracks do |import|
      import.tracks.count
    end
    column :processed_fully do |import|
      import.processed?
    end
    actions
  end

  show do
    panel "Main info" do
      default_main_content
    end

    panel "Tracks" do
      tracks = import.tracks.preload(:artist).page(params[:page]).per(15).ordered

      paginated_collection(tracks, download_links: false) do
        table_for(collection, sortable: false) do
          column :title
          column :artist
          column :spotify_identifier do |track|
            track.spotify_id
          end
        end
      end
    end
  end
end