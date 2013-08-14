class RenameAvatarInArtistsAgain < ActiveRecord::Migration
  def change
    rename_column :artists, :defaultavatar, :avatar
  end
end
