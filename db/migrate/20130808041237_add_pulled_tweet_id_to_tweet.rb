class AddPulledTweetIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :pulled_tweet_id, :string
  end
end
