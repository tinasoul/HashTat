class CreateTattoos < ActiveRecord::Migration
  def change
    create_table :tattoos do |t|
      t.string  :picture
      t.text    :description
      t.string  :gender
      t.string  :body_location
      t.string  :studio
      t.string  :artist
      t.text    :hashtags
      t.references :user
      t.timestamps
    end
  end
end
