class AddColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :vanity_url, :string
  end
end
