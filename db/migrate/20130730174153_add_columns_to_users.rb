class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :about_me, :text
    add_column :users, :location, :string
    add_column :users, :tat_number, :integer
    add_column :users, :fav_artist, :string
    add_column :users, :memorable_story, :text
  end
end
