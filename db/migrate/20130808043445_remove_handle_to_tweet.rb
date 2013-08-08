class RemoveHandleToTweet < ActiveRecord::Migration
  def up
    remove_column :tweets, :handle
  end

  def down
    add_column :tweets, :handle, :string
  end
end
