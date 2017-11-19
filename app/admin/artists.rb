ActiveAdmin.register Artist do
  show do
    panel "Basic info" do
      default_main_content
    end

    panel "Tracks" do
      tracks = artist.tracks.page(params[:page]).per(15).ordered

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