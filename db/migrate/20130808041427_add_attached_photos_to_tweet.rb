class AddAttachedPhotosToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :attached_photos, :text
  end
end
