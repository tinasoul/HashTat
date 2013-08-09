class AddTwitterPhotoToTattoo < ActiveRecord::Migration
  def change
    add_column :tattoos, :twitter_photo, :string
  end
end
