class AddAndChangeUserColumns < ActiveRecord::Migration
  def change
    rename_column :tattoos, :user_id, :enthusiast_id
    add_column :tattoos, :artist_id, :integer
  end
end
