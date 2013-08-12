class AddHashtagsToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :hashtags, :string
  end
end
