class AddArtistIdToTattoos < ActiveRecord::Migration
  def change
    rename_column :tattoos, :artist, :artist_name
    rename_column :tattoos, :enthusiast_id, :user_id
  end
end
