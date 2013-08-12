class Tweet < ActiveRecord::Base
  attr_accessible :text, :pulled_tweet_id, :attached_photos, :handle, :hashtags, :twitter_photo
  
  validates_uniqueness_of :pulled_tweet_id
  serialize :attached_photos

  def self.pull_tweets
    last_tweet = Tweet.order('pulled_tweet_id').last

    options = {}
    options[:since_id] = last_tweet.pulled_tweet_id unless last_tweet.nil?

     Twitter.search("#hashtat", options).results.map do |tweet|
      hashtags = []
      tweet.hashtags.each do |hashtag|
        hashtag = "##{hashtag.text}" 
        hashtags << hashtag
      end
      hashtags = hashtags.join(' ')
       

      Tweet.create!(pulled_tweet_id: tweet.id.to_s,
        text: tweet.text,
        attached_photos: tweet.media,
        handle: tweet.user.screen_name,
        hashtags: hashtags
      )

      if User.find_by_username(tweet.user.screen_name)
        u = User.find_by_username(tweet.user.screen_name) 

        tweet.media.each do |photo| 
          @tattoo = u.tattoos.create(twitter_photo: photo.media_url, hashtags: hashtags)
        end
      end
    end
  end
end








