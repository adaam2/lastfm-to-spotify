ActiveAdmin.register Import do
  index do
    column :id
    column :name
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
        end
      end
    end
  end
end