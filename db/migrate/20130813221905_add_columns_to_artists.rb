class AddColumnsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :tattoo_shop_url, :string
    add_column :artists, :email, :string
    add_column :artists, :phone, :string
    add_column :artists, :color_scheme, :string
  end
end
