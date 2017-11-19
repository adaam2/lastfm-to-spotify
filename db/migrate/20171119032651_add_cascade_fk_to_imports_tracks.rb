class AddCascadeFkToImportsTracks < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :imports_tracks, :imports
    add_foreign_key :imports_tracks, :imports, on_delete: :cascade
  end
end
