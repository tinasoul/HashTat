class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :location
      t.string :tattoo_shop
      t.string :avatar
      t.string :specialties
      t.text :bio
      t.string :instagram
      t.string :flickr
      t.string :twitter
      t.string :facebook
      t.string :cover_photo

      t.timestamps
    end
  end
end
