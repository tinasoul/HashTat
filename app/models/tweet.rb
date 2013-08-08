class Tweet < ActiveRecord::Base
  attr_accessible :text, :pulled_tweet_id, :attached_photos, :handle
  # :pulled_twitter_hashtag
  
  has_many :tattoos
  serialize :attached_photos

  def self.pull_tweets
    Twitter.search("#hashtat").results.map do |tweet|
     create!(pulled_tweet_id: tweet.id.to_s,
      text: tweet.text,
      attached_photos: tweet.media,
      handle: tweet.user.screen_name)
      # pulled_twitter_hashtag: tweet.text.hashtag


      if User.find_by_username(tweet.user.screen_name)
        u = User.find_by_username(tweet.user.screen_name)
        tweet.media.each do |photo|
          File.write("public/tattoos/#{photo.id}.jpg", open(photo.media_url).read, {mode: 'wb'})
          #TODO: need to figure out how to get twitter images up to s3 seamlessly
          #@tattoo = u.tattoos.create(description: tweet.text, picture: photo)
          @tattoo = u.tattoos.create(description: tweet.text)
       else
        s = User.new
        tweet.media.each do |photo|
        File.write("public/tattoos/#{photo.id}.jpg", open(photo.media_url).read, {mode: 'wb'})



        end
      end
    end
  end
end
