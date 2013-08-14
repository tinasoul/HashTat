class AddDefaultAvatarToArtists < ActiveRecord::Migration
  def change
    change_column :artists, :avatar, :string, :default => "hashlogo.png"
  end
end
