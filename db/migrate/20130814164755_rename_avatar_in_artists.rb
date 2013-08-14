class RenameAvatarInArtists < ActiveRecord::Migration
  def change
    rename_column :artists, :avatar, :defaultavatar
  end
end
